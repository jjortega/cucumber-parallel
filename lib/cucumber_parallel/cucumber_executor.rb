require 'celluloid/autostart'

module CucumberParallel
  class CucumberExecutor
    include Celluloid
    attr_reader :result

    def run(node, feature_path, *cucumber_configuration)
      node.lock
      randomNumber = Random.rand(1000)
      deviceName = node.name
      #cmd = "DEVICE_NAME='#{deviceName}' cucumber -p android #{feature_path} --format pretty --format html --out results/cucumber#{randomNumber}.html --format json --out results/cucumber#{randomNumber}.json"
      cmd = "DEVICE_NAME='#{deviceName}' cucumber #{feature_path} --format pretty --format html --out results/cucumber#{randomNumber}.html --format json --out results/cucumber#{randomNumber}.json"
      p "Running: #{cmd}"
      @result = %x(#{cmd})
      sleep(10)
      node.release
      "Command End: #{cmd}"
    end
  end
end
