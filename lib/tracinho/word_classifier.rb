module Tracinho
  class WordClassifier
    ENDINGS = /(?:(ste)|(sse)|[^-](mos)|(-(se|mos))|[^s](-te)|(s-te))$/

    def initialize(word)
      @word = word
    end

    def full_classification
      #case @word.text
      #when /ste$/
      #  "Segunda pessoa do singular do #{full_verb}."
      #when /sse$/
      #  "Primeira ou terceira pessoa do singular do #{full_verb}."
      #when /mos$/
      #  "Primeira pessoa do plural do presente do indicativo ou pretérito perfeito do indicativo do verbo #{verb}."
      #when /#{DASH_CHAR}te$/
      #  "Conjugação pronominal reflexa da segunda pessoa do singular do presente do indicativo do verbo #{verb}."
      #when /#{DASH_CHAR}se$/
      #  "Conjugação pronominal reflexa da segunda pessoa do singular do presente do indicativo do verbo #{verb}."
      #when /#{DASH_CHAR}mos$/
      #  "Conjugação pronominal da segunda pessoa do singular do imperativo do verbo #{verb}."
      #end
    end

    def verb
      endings = @word.text.match(ENDINGS).captures.compact

      @word.text.sub(endings.first, 'r')
    end

    def verb_tense
    end

    def full_verb
      "#{verb_tense} do verbo #{verb}"
    end
  end
end
