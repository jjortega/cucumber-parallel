require "celluloid/autostart"

require "selenium_grid_console_parser"

require "cucumber_parallel/cucumber_executor"

require "byebug"

module CucumberParallel
  class CucumberThreadHandler
    def initialize(nodes)
      @nodes = nodes
    end

    def run(features_path, cucumber_configuration)
      _times_to_run = features_path.size
      cucumber_pool_executor = CucumberExecutor.pool(size: @nodes.size)
      futures = []
      while features_path.size > 0 do
        if @nodes.any_node_is_free?
          node = @nodes.first_available_node
          futures.push cucumber_pool_executor.future.run(node, features_path.pop, cucumber_configuration)
        end
      end
      futures.each do |f|
        p f.value
      end
    end
  end
end
