module Tracinho
  class WordClassifier
    ENDINGS = /(?:(ste)|(sse)|[^-](mos)|(-(se|mos))|[^s](-te)|(s-te))$/

    def initialize(word)
      @word = word
    end

    def full_classification
      case @word.text
      when /ste$/
        "Segunda pessoa do singular do #{full_verb}."
      when /sse$/
        "Primeira ou terceira pessoa do singular do #{full_verb}."
      when /[^-]mos$/
        "Primeira pessoa do plural do #{full_verb}."
      when /(-te | -se)$/
        "Conjugação pronominal reflexa da segunda pessoa do #{full_verb}."
      when /-mos$/
        "Conjugação pronominal da segunda pessoa do singular do #{full_verb}."
      end
    end

    def verb
      endings = @word.text.match(ENDINGS).captures.compact

      verb = @word.text.sub(endings.first, 'r')
      verb.sub!(/rr$/, 'r')
      verb.sub!(/our$/, 'ar')

      # Irregular verbs that got bad guesses
      verb = verb.sub(/^var$/, 'ir').sub(/^sor$/, 'ser').sub(/^for$/, 'ser')

      verb
    end

    def verb_tense
      case @word.text
      when /ste$/
        'pretérito perfeito do indicativo'
      when /sse$/
        'pretérito imperfeito do conjuntivo'
      when /[^-]mos$/
        'presente do indicativo ou pretérito perfeito do indicativo'
      when /(-te | -se)$/
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
