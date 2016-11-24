require "cucumber_parallel/version"
require "cucumber_parallel/nodes/node_provider"

require "cucumber_parallel/cucumber_thread_handler"
require "cucumber_parallel/feature/feature_spliter"

require "cucumber_parallel/report/report_builder"

module CucumberParallel
  class Mode
    def self.split_features(cucumber_parallel_options, cucumber_options) #TODO: Change URL for NodeProviderConfiguration
      node_provider = NodeProvider.new(cucumber_parallel_options[:url]).nodes_with_lock
      cucumber_thread_handler = CucumberThreadHandler.new(node_provider)
      feaures_path = FeatureSpliter.new(cucumber_parallel_options[:feature_path]).split
      report = ReportMergeBuilder.new(cucumber_parallel_options[:output_file])
      report.configure
      cucumber_configuration = {options: cucumber_options, output_file: report.tmp_path}
      begin
        cucumber_thread_handler.run(feaures_path.to_a,cucumber_configuration)
      end
      report.merge
    end
  end
end
