module Tracinho
  class Word
    attr_accessor :text

    def initialize(text)
      self.text = text
    end

    def hyphenated?
      text.include?('-')
    end

    def complement
      ComplementBuilder.new(self).build
    end

    def grammar_class
    end

    def to_s
      text
    end
  end
end
