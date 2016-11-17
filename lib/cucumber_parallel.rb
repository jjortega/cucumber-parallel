require "cucumber_parallel/version"
require "cucumber_parallel/nodes/node_provider"

require "cucumber_parallel/cucumber_thread_handler"
require "cucumber_parallel/feature/feature_spliter"

require "byebug"

module CucumberParallel
  class Mode
    def self.split_features(url, feature_path, **cucumber_configuration) #TODO: Change URL for NodeProviderConfiguration
      node_provider = NodeProvider.new(url).nodes_with_lock
      cucumber_thread_handler = CucumberThreadHandler.new(node_provider)
      _feaures_path = FeatureSpliter.new(feature_path).split
      cucumber_thread_handler.run(_feaures_path.to_a)
    end
  end
end
