require 'no_equals/repos/stack_cache'

module NoEquals
  module Divide
    def self.execute(&failure_policy)
      StackCache.stack.divide(&failure_policy)
    end
  end
end
