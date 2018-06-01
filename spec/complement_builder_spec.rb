# frozen_string_literal: true

describe ComplementBuilder do
  let(:hyphenated) { %w[passa-mos cala-te matas-te conhecer-te morde-mos mata-te] }
  let(:not_hyphenated) { %w[passamos calate mataste conhecerte mordemos matate] }

  describe '#build' do
    it 'complements hyphenated words correctly' do
      hyphenated.each_with_index do |word, index|
        word = Tracinho::Word.new(word)

        expect(described_class.new(word).build.to_s).to eq(not_hyphenated[index])
      end
    end

    it 'complements not hyphenated words correctly' do
      not_hyphenated.each_with_index do |word, index|
        word = Tracinho::Word.new(word)

        expect(described_class.new(word).build.to_s).to eq(hyphenated[index])
      end
    end
  end
end
