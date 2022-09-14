# frozen_string_literal: true

RSpec.describe 'Array' do
  let(:a) { 'a' }
  let(:b) { 'b' }
  let(:c) { 'c' }
  let(:colored_a) { "\033[38;5;179ma\033[0m" }
  let(:colored_b) { "\033[38;5;190mb\033[0m" }
  let(:colored_c) { "\033[38;5;177mc\033[0m" }

  let(:original) { [a, [b, c]] }
  let(:expected_target) { [colored_a, [colored_b, colored_c]] }

  describe '#skittlize' do
    subject(:process) { original.skittlize }

    it { is_expected.to eq(expected_target) }

    it 'does not replace the original Object' do
      process
      expect(original).to eq(['a', ['b', 'c']])
    end
  end

  describe '#skittlize!' do
    subject(:process) { original.skittlize! }

    it { is_expected.to eq(expected_target) }

    it 'replaces the original Object' do
      process
      expect(original).not_to eq(['a', ['b', 'c']])
    end
  end
end
