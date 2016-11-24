require 'celluloid/autostart'
require 'securerandom'

module CucumberParallel
  class CucumberExecutor
    include Celluloid
    attr_reader :result

    def run(node, feature_path, cucumber_configuration)
      node.lock
      randomNumber = SecureRandom.uuid
      deviceName = node.name
      cucumber_options = cucumber_configuration[:options].join(' ')
      cmd = "DEVICE_NAME='#{deviceName}' cucumber #{cucumber_options} #{feature_path} --format json --out #{cucumber_configuration[:output_file]}/cucumber#{randomNumber}.json"
      p "Running: #{cmd}"
      @result = %x(#{cmd} > #{cucumber_configuration[:output_file]}/../logs/cucumber#{randomNumber}.log)
      node.release
      p "Command End: #{cmd}"
    end
  end
end
