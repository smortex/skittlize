RSpec.describe Skittlize do
  describe 'String' do
    let(:original) { 'Hello World' }

    describe '#skittle_color' do
      let(:subject) { original.skittle_color }
      it { is_expected.to eq(96) }
    end

    describe '#skittlize' do
      let(:subject) { original.skittlize }
      it { is_expected.to eq("\033[38;5;96mHello World\033[0m") }
      it 'should not replace the original Object' do
        subject
        expect(original).to eq('Hello World')
      end
    end

    describe '#skittlize!' do
      let(:subject) { original.skittlize! }
      it { is_expected.to eq("\033[38;5;96mHello World\033[0m") }
      it 'should replace the original Object' do
        subject
        expect(original).to_not eq('Hello World')
      end
    end
  end

  describe 'Array' do
    let(:original) { ['a', ['b', 'c']] }
    let(:expected_target) { ["\033[38;5;179ma\033[0m", ["\033[38;5;190mb\033[0m", "\033[38;5;177mc\033[0m"]] }

    describe '#skittlize' do
      let(:subject) { original.skittlize }

      it { is_expected.to eq(expected_target) }
      it 'should not replace the original Object' do
        subject
        expect(original).to eq(['a', ['b', 'c']])
      end
    end

    describe '#skittlize!' do
      let(:subject) { original.skittlize! }

      it { is_expected.to eq(expected_target) }
      it 'should replace the original Object' do
        subject
        expect(original).to_not eq(['a', ['b', 'c']])
      end
    end
  end
end
