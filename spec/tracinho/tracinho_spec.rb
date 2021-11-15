# frozen_string_literal: true

describe Tracinho do
  describe '.pair?' do
    subject(:result) { described_class.pair?(word1, word2) }

    let(:word1) { Tracinho::Word.new('fizeste') }
    let(:word2) { Tracinho::Word.new('fizes-te') }

    context 'when the two words are complementary' do
      it 'returns true' do
        expect(result).to be_truthy
      end
    end

    context 'when the two words are not complementary' do
      let(:word1) { Tracinho::Word.new('fizeste') }
      let(:word2) { Tracinho::Word.new('fizestes') }

      it 'returns false' do
        expect(result).to be_falsey
      end
    end

    context 'when using strings' do
      let(:word1) { Tracinho::Word.new('mandasse') }
      let(:word2) { 'manda-se' }

      it 'works with as expected' do
        expect(result).to be_truthy
      end
    end

    it 'has an alias `complementary?`' do
      expect(described_class).to be_complementary(word1, word2)
    end
  end
end
