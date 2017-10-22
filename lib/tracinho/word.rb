# frozen_string_literal: true

module Tracinho
  # Word is the class that represents a word (duh!). It includes some methods to quickly get the
  # complement word or the classification.
  #
  # Example:
  #
  #   word = Tracinho::Word.new('comeste')
  #
  #   word.hyphenated?
  #   # => false
  #
  #   word.complement
  #   # => "comes-te"
  #
  #   word.grammar_class
  #   # => "Segunda pessoa do singular do pretérito perfeito do indicativo do verbo comer."
  class Word
    def initialize(text)
      @text = text
    end

    # Returns true if the word as a hyphen (the '-' character) or false otherwise.
    def hyphenated?
      @text.include?('-')
    end

    # Returns the complement of the word.
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
