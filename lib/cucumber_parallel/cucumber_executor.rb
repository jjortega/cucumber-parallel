require 'celluloid/autostart'

module CucumberParallel
  class CucumberExecutor
    include Celluloid
    attr_reader :result

    def run(node, feature_path, cucumber_configuration)
      node.lock
      randomNumber = Random.rand(1000)
      deviceName = node.name
      cucumber_configuration = cucumber_configuration.join(' ')
      cmd = "DEVICE_NAME='#{deviceName}' cucumber #{cucumber_configuration} #{feature_path} --format pretty --format html --out results/cucumber#{randomNumber}.html --format json --out results/cucumber#{randomNumber}.json"
      p "Running: #{cmd}"
      @result = %x(#{cmd})
      node.release
      "Command End: #{cmd}"
    end
  end
end
