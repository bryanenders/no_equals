require 'no_equals/repos/stack_cache'

module NoEquals
  module Multiply
    def self.execute(&failure_policy)
      StackCache.stack.multiply(&failure_policy)
    end
  end
end
