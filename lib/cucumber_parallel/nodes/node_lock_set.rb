require "selenium_grid_console_parser"

module CucumberParallel
  class NodeLockSet < SeleniumGridConsoleParser::Nodes::GridNodeSet
    def first_available_node
      _free_nodes = free_nodes
      _free_nodes.each do |free_node|
        return free_node unless free_node.locked?
      end
      return nil
    end

    def any_node_is_free?
      !first_available_node.nil?
    end
  end
end