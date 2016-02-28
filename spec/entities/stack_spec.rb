require 'spec_helper'

module NoEquals
  describe Stack do
    let(:stack) { Stack.new }

    describe '#result' do
      let(:result) { stack.result }
      it 'is nil' do
        expect(result).to be_nil
      end
      it 'is the last value pushed' do
        (1..5).each { |x| stack.push(x) }
        expect(result).to eq(5)
      end
      context 'when two values have been pushed' do
        before do
          stack.push(2.5)
          stack.push(12.5)
        end
        it 'is their sum, after adding' do
          stack.add
          expect(result).to eq(15)
        end
      end
    end

    describe '#add' do
      def add_with_failure_policy
        stack.add { |x| mock_handler.handle(x) }
      end
      let(:error) { NoEquals::UndefinedBehavior }
      let(:mock_handler) { double('ExceptionHandler') }
      it "raises 'UndefinedBehavior' error" do
        expect { stack.add }.to raise_error(error)
      end
      it 'calls the failure policy' do
        expect(mock_handler).to receive(:handle).with(error)
        add_with_failure_policy
      end
      context 'when one value has been pushed' do
        before { stack.push(9) }
        it "raises 'UndefinedBehavior' error" do
          expect { stack.add }.to raise_error(error)
        end
        it 'clears the result' do
          stack.add rescue
          expect(stack.result).to be_nil
        end
        it 'calls the failure policy' do
          expect(mock_handler).to receive(:handle).with(error)
          add_with_failure_policy
        end
      end
      context 'when multiple values have been pushed' do
        before do
          stack.push(3)
          stack.push(-4)
        end
        it "doesn't raise an error" do
          expect { stack.add }.not_to raise_error
        end
        it "doesn't call the failure policy" do
          expect(mock_handler).not_to receive(:handle)
          add_with_failure_policy
        end
      end
    end
  end
end
