require 'no_equals/repos/stack_cache'

module NoEquals
  module Subtract
    def self.execute(&failure_policy)
      StackCache.stack.subtract(&failure_policy)
    end
  end
end
