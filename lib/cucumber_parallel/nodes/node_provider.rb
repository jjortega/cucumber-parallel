require "selenium_grid_console_parser"

require "cucumber_parallel/nodes/node_lock"
require "cucumber_parallel/nodes/node_lock_set"

module CucumberParallel
  class NodeProvider
    def initialize(selenium_grid_url)
      @url = selenium_grid_url
    end

    def nodes_with_lock
      selenium_grid_nodes = SeleniumGridConsoleParser.nodes(@url)
      nodes = NodeLockSet.new
      selenium_grid_nodes.each do |node|
        nodes << NodeLock.new(node)
      end
      nodes
    end
  end
end
