module Tracinho
  class Word
    attr_accessor :text

    def initialize(text)
      self.text = text
    end

    def has_dash?
      text.include?('-')
    end

    def complement
      ComplementBuilder(self).build
    end

    def grammar_class

    end
  end
end

#class String
#  def complement
#    dup.complement!
#  end
#
#  def complement!
#    if tracinho?
#      term = self[self.index("-")+1].chr
#      term.eql?("s") ? self.gsub("-", term) : self.gsub("-", "")
#    else
#      term = self[self.length-2..-1]
#      if term.eql?("os")
#        self.insert(self.length-3, "-")
#      elsif term.eql?("se")
#        ntitle = self.insert(self.length-2, "-")
#        ntitle.gsub("s-", "-")
#      else
#        self.insert(self.length-2, "-")
#      end
#    end
#  end
#
#  # Retorna a classe da palavra, por tentativa de adivinhação
#  def word_class
#    if !self.tracinho?
#      term = self[self.size-3..-1]
#      verb = self[0..self.size-4] << "r"
#      if term.eql?("ste")
#        "Segunda pessoa do singular do pretérito perfeito do indicativo do verbo #{verb}."
#      elsif term.eql?("sse")
#        "Primeira ou terceira pessoa do singular do pretérito imperfeito do conjuntivo do verbo #{verb}."
#      elsif term.eql?("mos")
#        "Primeira pessoa do plural do presente do indicativo ou pretérito perfeito do indicativo do verbo #{verb}."
#      end
#    else
#      term = self[self.index("-")+1..-1]
#      if term.eql?("te")
#        verb = self[0..self.index("-")-2] << "r"
#        "Conjugação pronominal reflexa da segunda pessoa do singular do presente do indicativo do verbo #{verb}."
#      elsif term.eql?("se")
#        verb = self[0..self.index("-")-1] << "r"
#        "Conjugação pronominal reflexa da segunda pessoa do singular do presente do indicativo verbo #{verb}."
#      elsif term.eql?("mos")
#        verb = self[0..self.index("-")-1] << "r"
#        "Conjugação pronominal da segunda pessoa do singular do imperativo do verbo #{verb}."
#      end
#    end
#  end
#end
