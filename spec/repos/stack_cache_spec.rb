require 'spec_helper'

module NoEquals
  describe StackCache do
    describe '::stack' do
      it 'returns the same stack' do
        expect(StackCache.stack).to eq(StackCache.stack)
      end
      it 'returns a different stack, after ::clear' do
        original_stack = StackCache.stack
        StackCache.clear
        expect(StackCache.stack).not_to eq(original_stack)
      end
    end
  end
end
