# frozen_string_literal: true

require 'spec_helper'

describe Word do
  let(:hyphenated) { %w[passa-mos cala-te matas-te conhecer-te morde-mos mata-te] }
  let(:not_hyphenated) { %w[passamos calate mataste conhecerte mordemos matate] }

  describe '#hyphenated?' do
    it 'returns true if the word has a hyphen' do
      hyphenated.each do |w|
        expect(described_class.new(w).hyphenated?).to be_truthy
      end
    end

    it 'returns false if the word does not have a hyphen' do
      not_hyphenated.each do |w|
        expect(described_class.new(w).hyphenated?).to be_falsey
      end
    end
  end

  describe '#complement' do
    it 'returns the complement of a word' do
      word = described_class.new('mataste')

      complement = word.complement

      expect(complement.to_s).to eq('matas-te')
    end
  end

  describe '#grammar_class' do
    it 'returns the class of a word' do
      word = described_class.new('matas-te')

      classification = word.grammar_class

      klass = 'Conjugação pronominal reflexa da segunda pessoa do presente do indicativo do verbo' \
              ' matar.'

      expect(classification).to eq(klass)
    end
  end

  describe '#to_s' do
    it 'returns the text attribute of the word' do
      (hyphenated + not_hyphenated).each do |w|
        expect(described_class.new(w).to_s).to eq(w)
      end
    end
  end
end
