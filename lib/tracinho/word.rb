module Tracinho
  class Word
    def initialize(text)
      @text = text
    end

    def hyphenated?
      @text.include?('-')
    end

    def complement
      ComplementBuilder.new(self).build
    end

    def grammar_class
      WordClassifier.new(self).full_classification
    end

    def to_s
      @text
    end
  end
end
