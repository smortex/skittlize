RSpec.describe String do
  let(:hello_world) { 'Hello World' }
  let(:a) { 'a' }
  let(:b) { 'b' }
  let(:c) { 'c' }
  let(:colored_hello_world) { "\033[38;5;96mHello World\033[0m" }
  let(:colored_a) { "\033[38;5;179ma\033[0m" }
  let(:colored_b) { "\033[38;5;190mb\033[0m" }
  let(:colored_c) { "\033[38;5;177mc\033[0m" }

  subject(:string) { hello_world }

  describe '#skittle_color' do
    subject { string.skittle_color }

    it { is_expected.to eq(96) }
  end

  describe '#skittlize' do
    let(:subject) { string.skittlize }

    it { is_expected.to eq("\033[38;5;96mHello World\033[0m") }
    it 'should not replace the original Object' do
      subject
      expect(string).to eq('Hello World')
    end
  end

  describe '#skittlize!' do
    let(:subject) { string.skittlize! }

    it { is_expected.to eq("\033[38;5;96mHello World\033[0m") }
    it 'should replace the original Object' do
      subject
      expect(string).to_not eq('Hello World')
    end
  end
end
