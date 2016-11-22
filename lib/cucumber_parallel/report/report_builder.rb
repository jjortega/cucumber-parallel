require 'report_builder'
require 'fileutils'

module CucumberParallel
  class ReportMergeBuilder
    attr_reader :tmp_path
    attr_accessor :output_file

    def initialize(out_path, tmp_path='reports/tmp')
      @output_file = out_path + "/cucumber"
      @tmp_path = tmp_path
      create_folder(@tmp_path)
      create_folder(@tmp_path + "../logs")
    end

    def configure
      default_options = OpenStruct.new(
          report_types:    [:json, :html],
          report_tabs:     [:overview, :features, :scenarios, :errors],
          report_title:    'Test Results',
          compress_images: false,
          additional_info: {}
      )
      yield default_options if block_given?
      @options = default_options.marshal_dump
    end

    def merge()
      ReportBuilder.configure do |config|
        config.json_path = @tmp_path
        config.report_path = @output_file
        config.report_types = @options[:report_types]
        config.report_tabs = @options[:report_tabs]
        config.report_title = @options[:report_title]
        config.compress_images = @options[:compress_images]
        config.additional_info = @options[:additional_info]
      end
      ReportBuilder.build_report
    end

    private

    def create_folder(folder_path)
      unless File.directory?(folder_path)
        FileUtils.mkdir_p(folder_path)
      end
    end
  end
end
