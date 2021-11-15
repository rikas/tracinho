# frozen_string_literal: true

describe Tracinho::VerbGuess do
  describe '#guess' do
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

    context "when it's a regular verb" do
      it 'correctly returns the verb of the word' do
        regular_words.each_with_index do |word, index|
          guesser = described_class.new(Tracinho::Word.new(word))

          expect(guesser.guess).to eq(regular_verbs[index])
        end
      end
    end

    context "when it's an irregular verb" do
      it 'correctly returns the verb of the word' do
        irregular_words.each_with_index do |word, index|
          guesser = described_class.new(Tracinho::Word.new(word))

          expect(guesser.guess).to eq(irregular_verbs[index])
        end
      end
    end
  end
end
