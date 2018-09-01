# frozen_string_literal: true

describe Tracinho do
  describe '.pair?' do
    it 'returns true if the two words are complementary' do
      w1 = Tracinho::Word.new('fizeste')
      w2 = Tracinho::Word.new('fizes-te')

      expect(described_class.pair?(w1, w2)).to be_truthy
      expect(described_class.pair?(w2, w1)).to be_truthy
    end

    it 'returns false if the two words are not complementary' do
      w1 = Tracinho::Word.new('fizeste')
      w2 = Tracinho::Word.new('fizeste')

      expect(described_class.pair?(w1, w2)).to be_falsey
      expect(described_class.pair?(w2, w1)).to be_falsey
    end

    it 'has an alias `complementary?`' do
      w1 = Tracinho::Word.new('fizeste')
      w2 = Tracinho::Word.new('fizes-te')

      expect(described_class.complementary?(w1, w2)).to be_truthy
      expect(described_class.complementary?(w2, w1)).to be_truthy
    end
  end
end
