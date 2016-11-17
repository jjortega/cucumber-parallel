require "forwardable"

module CucumberParallel
  class NodeLock
    attr_reader :lock, :node
    extend Forwardable
    def_delegators :@node, :free?, :name, :to_hash

    def initialize(node,lock=false)
      @node = node
      @lock = lock
    end

    def locked?
      @lock || !free?
    end

    def lock
      @lock = true if free?
    end

    def release
      @lock = false
    end
  end
end