require 'no_equals/repos/stack_cache'

module NoEquals
  module Add
    def self.execute(&failure_policy)
      StackCache.stack.add(&failure_policy)
    end
  end
end
