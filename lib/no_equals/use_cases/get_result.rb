require 'no_equals/repos/stack_cache'

module NoEquals
  module GetResult
    def self.execute
      StackCache.stack.result
    end
  end
end
