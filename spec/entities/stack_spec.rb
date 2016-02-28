require 'spec_helper'

module NoEquals
  describe Stack do
    let(:stack) { Stack.new }
    let(:error) { NoEquals::UndefinedBehavior }
    let(:mock_handler) { double('ExceptionHandler') }

    shared_examples 'an arithmetic operation' do |method|
      let(:execute) do
        stack.send(method)
      end
      let(:execute_with_failure_policy) do
        stack.send(method) { |x| mock_handler.handle(x) }
      end
      it "raises 'UndefinedBehavior' error" do
        expect { execute }.to raise_error(error)
      end
      it 'calls the failure policy' do
        expect(mock_handler).to receive(:handle).with(error)
        execute_with_failure_policy
      end
      context 'when one value has been pushed' do
        before { stack.push(9) }
        it "raises 'UndefinedBehavior' error" do
          expect { execute }.to raise_error(error)
        end
        it 'clears the result' do
          execute rescue
          expect(stack.result).to be_nil
        end
        it 'calls the failure policy' do
          expect(mock_handler).to receive(:handle).with(error)
          execute_with_failure_policy
        end
      end
      context 'when multiple values have been pushed' do
        before do
          stack.push(3)
          stack.push(-4)
        end
        it "doesn't raise an error" do
          expect { execute }.not_to raise_error
        end
        it "doesn't call the failure policy" do
          expect(mock_handler).not_to receive(:handle)
          execute_with_failure_policy
        end
      end
    end

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
        it 'is their difference, after subtracting' do
          stack.subtract
          expect(result).to eq(-10)
        end
        it 'is their product, after multiplying' do
          stack.multiply
          expect(result).to eq(31.25)
        end
        it 'is their quotient, after dividing' do
          stack.divide
          expect(result).to eq(0.2)
        end
      end
    end

    describe '#add' do
      it_behaves_like 'an arithmetic operation', :add
    end

    describe '#subtract' do
      it_behaves_like 'an arithmetic operation', :subtract
    end

    describe '#multiply' do
      it_behaves_like 'an arithmetic operation', :multiply
    end

    describe '#divide' do
      it_behaves_like 'an arithmetic operation', :divide
      context 'when the divisor is zero' do
        before do
          stack.push(1.3)
          stack.push(0)
        end
        it "raises 'UndefinedBehavior' error" do
          expect { stack.divide }.to raise_error(error)
        end
        it 'calls the failure policy' do
          expect(mock_handler).to receive(:handle).with(error)
          stack.divide { |x| mock_handler.handle(x) }
        end
      end
    end
  end
end
