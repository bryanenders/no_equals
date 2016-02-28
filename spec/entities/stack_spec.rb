require 'spec_helper'

module NoEquals
  describe Stack do
    describe '#result' do
      let(:stack) { Stack.new }
      let(:result) { stack.result }
      it 'is nil' do
        expect(result).to be_nil
      end
      it 'is the last value pushed' do
        (1..5).each { |x| stack.push(x) }
        expect(result).to eq(5)
      end
    end
  end
end
