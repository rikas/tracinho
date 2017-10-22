# frozen_string_literal: true

module Tracinho
  # ComplementBuilder converts words with dash in the version without it and vice-versa.
  class ComplementBuilder
    def initialize(word)
      @word = word
    end

    # Builds the complementary word.
    #
    #  ComplementBuilder.new(Word.new('fizeste')).build
    #  # => #<Tracinho::Word:0x007f8a9b0ba928 @text="fize-te">
    #
    #  ComplementBuilder.new(Word.new('passa-mos')).build
    #  # => #<Tracinho::Word:0x007f8a9b10f270 @text="passamos">
    def build
      text = @word.hyphenated? ? remove_dash(@word.to_s) : add_dash(@word.to_s)

      Word.new(text)
    end

    private

    def remove_dash(text)
      text.match?(/\-se$/) ? text.dup.tr('-', 's') : text.dup.delete('-')
    end

    def add_dash(text)
      case text
      when /os$/
        text.dup.insert(-4, '-')
      else
        text.dup.insert(-3, '-')
      end
    end
  end
end
