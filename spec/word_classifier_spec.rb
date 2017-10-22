# frozen_string_literal: true

require 'spec_helper'

describe WordClassifier do
  describe 'verb' do
    let(:regular_words) do
      %w[bebemos comesse mijaste cagou-se passa-mos cala-te matas-te conhecer-te morde-mos mata-te]
    end

    let(:regular_verbs) do
      %w[beber comer mijar cagar passar calar matar conhecer morder matar]
    end

    let(:irregular_words) do
      %w[vamos somos fomos]
    end

    let(:irregular_verbs) do
      %w[ir ser ser]
    end

    context 'for regular verbs' do
      it 'correctly returns the verb of the word' do
        regular_words.each_with_index do |word, index|
          classifier = described_class.new(Word.new(word))

          expect(classifier.verb).to eq(regular_verbs[index])
        end
      end
    end

    context 'for irregular verbs' do
      it 'correctly returns the verb of the word' do
        irregular_words.each_with_index do |word, index|
          classifier = described_class.new(Word.new(word))

          expect(classifier.verb).to eq(irregular_verbs[index])
        end
      end
    end
  end

  describe 'full_classification' do
    let(:classifications) do
      [
        'Segunda pessoa do singular do pretérito perfeito do indicativo do verbo mijar.',
        'Primeira ou terceira pessoa do singular do pretérito imperfeito do conjuntivo do ' \
        'verbo beber.',
        'Primeira pessoa do plural do presente do indicativo ou pretérito perfeito do ' \
        'indicativo do verbo conhecer.',
        'Conjugação pronominal da segunda pessoa do singular do imperativo do verbo buscar.'
      ]
    end

    %w[mijaste bebesse conhecemos busca-mos].each_with_index do |word, index|
      it "correctly returns the full classification of the word '#{word}'" do
        classifier = described_class.new(Word.new(word))

        expect(classifier.full_classification).to eq(classifications[index])
      end
    end
  end
end
