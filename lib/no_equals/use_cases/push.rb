require 'no_equals/repos/stack_cache'

module NoEquals
  module Push
    def self.execute(value)
      StackCache.stack.push(value)
    end
  end
end
