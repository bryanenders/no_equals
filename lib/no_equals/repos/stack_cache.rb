require 'no_equals/entities/stack'

module NoEquals
  module StackCache
    def self.clear
      @stack = nil
    end

    def self.stack
      @stack ||= Stack.new
    end
  end
end
