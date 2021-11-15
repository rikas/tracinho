# frozen_string_literal: true

describe Tracinho::ComplementBuilder do
  hyphenated = %w[passa-mos cala-te matas-te conhecer-te morde-mos mata-te]
  not_hyphenated = %w[passamos calate mataste conhecerte mordemos matate]

  describe '#build' do
    it 'returns a Tracinho::Word instance' do
      word = Tracinho::Word.new('comeste')

      expect(described_class.new(word).build).to be_a(Tracinho::Word)
    end

    hyphenated.each_with_index do |word, index|
      it "complements hyphenated word - #{word} - correctly" do
        word = Tracinho::Word.new(word)

        expect(described_class.new(word).build.to_s).to eq(not_hyphenated[index])
      end
    end

    not_hyphenated.each_with_index do |word, index|
      it "complements non hyphenated word - #{word} - correctly" do
        word = Tracinho::Word.new(word)

        expect(described_class.new(word).build.to_s).to eq(hyphenated[index])
      end
    end
  end
end
