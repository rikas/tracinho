# frozen_string_literal: true

module Tracinho
  # VerbGuess will try to get the verb from a given word.
  #
  # Example:
  #
  #   guesser = Tracinho::VerbGuess.new('comeste')
  #
  #   guesser.guess
  #   # => "comer"
  class VerbGuess
    ENDINGS = /(?:(ste)|(sse)|[^-](mos)|(-(se|mos))|[^s](-te)|(s-te))$/.freeze #:nodoc:

    def initialize(word)
      @word = word.to_s.downcase
      @guess = nil
    end

    def guess
      endings = @word.match(ENDINGS).captures.compact

      @guess = @word.sub(endings.first, 'r')

      fix_irregulars
    end

    private

    def fix_irregulars
      @guess.sub!(/rr$/, 'r')
      @guess.sub!(/our$/, 'ar')

      # Irregular verbs that got bad guesses
      @guess.sub(/^var$/, 'ir').sub(/^sor$/, 'ser').sub(/^for$/, 'ser')
    end
  end
end
