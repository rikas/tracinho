# frozen_string_literal: true

describe Tracinho::WordClassifier do
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
        classifier = described_class.new(Tracinho::Word.new(word))

        expect(classifier.full_classification).to eq(classifications[index])
      end
    end
  end
end
