# frozen_string_literal: true

module Tracinho
  # WordClassifier is the responsible for classifying a word. It gives the verb, the verb tense and
  # the full classification of a Word.
  #
  # Example:
  #
  #   word = Tracinho::Word.new('comeste')
  #
  #   classifier = Tracinho::WordClassifier.new(word)
  #   classifier.verb
  #   # => "comer"
  #
  #   classifier.verb_tense
  #   # => "pretérito perfeito do indicativo"
  #
  #   classifier.full_classification
  #   # => "Segunda pessoa do singular do pretérito perfeito do indicativo do verbo comer."
  class WordClassifier
    ENDINGS = /(?:(ste)|(sse)|[^-](mos)|(-(se|mos))|[^s](-te)|(s-te))$/.freeze #:nodoc:

    def initialize(word)
      @word = word
    end

    # Returns the full classification of a word
    #
    #   word = Tracinho::Word.new('matas-te')
    #
    #   classifier = Tracinho::WordClassifier.new(word)
    #   classifier.full_classification
    #   # => "Conjugação pronominal reflexa da segunda pessoa do presente do indicat..."
    def full_classification
      case @word.to_s
      when /ste$/
        "Segunda pessoa do singular do #{full_verb}."
      when /sse$/
        "Primeira ou terceira pessoa do singular do #{full_verb}."
      when /[^-]mos$/
        "Primeira pessoa do plural do #{full_verb}."
      when /(-te|-se)$/
        "Conjugação pronominal reflexa da segunda pessoa do #{full_verb}."
      when /-mos$/
        "Conjugação pronominal da segunda pessoa do singular do #{full_verb}."
      end
    end

    def verb
      endings = @word.to_s.match(ENDINGS).captures.compact

      verb = @word.to_s.sub(endings.first, 'r')
      verb.sub!(/rr$/, 'r')
      verb.sub!(/our$/, 'ar')

      # Irregular verbs that got bad guesses
      verb = verb.sub(/^var$/, 'ir').sub(/^sor$/, 'ser').sub(/^for$/, 'ser')

      verb
    end

    def verb_tense
      case @word.to_s
      when /ste$/
        'pretérito perfeito do indicativo'
      when /sse$/
        'pretérito imperfeito do conjuntivo'
      when /[^-]mos$/
        'presente do indicativo ou pretérito perfeito do indicativo'
      when /(-te|-se)$/
        'presente do indicativo'
      when /-mos$/
        'imperativo'
      end
    end

    private

    def full_verb
      "#{verb_tense} do verbo #{verb}"
    end
  end
end
