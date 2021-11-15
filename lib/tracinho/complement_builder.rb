# frozen_string_literal: true

module Tracinho
  # ComplementBuilder converts words with dash in the version without it and vice-versa.
  class ComplementBuilder
    def initialize(word)
      @word = word
      @complement = nil
    end

    # Builds the complementary word.
    #
    #  ComplementBuilder.new(Word.new('fizeste')).build
    #  # => #<Tracinho::Word:0x007f8a9b0ba928 @text="fize-te">
    #
    #  ComplementBuilder.new(Word.new('passa-mos')).build
    #  # => #<Tracinho::Word:0x007f8a9b10f270 @text="passamos">
    def build
      @complement = @word.to_s

      Word.new(@word.hyphenated? ? remove_dash : add_dash)
    end

    private

    def remove_dash
      @complement.match?(/-se$/) ? @complement.tr('-', 's') : @complement.delete('-')
    end

    def add_dash
      @complement = @complement.dup

      case @complement
      when /os$/
        @complement.insert(-4, '-')
      when /sse$/
        @complement.gsub(/sse/, '-se')
      else
        @complement.insert(-3, '-')
      end
    end
  end
end
