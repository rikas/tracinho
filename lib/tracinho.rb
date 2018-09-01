# frozen_string_literal: true

require 'tracinho/version'
require 'tracinho/complement_builder'
require 'tracinho/word'
require 'tracinho/word_classifier'

# Main module
module Tracinho
  # Returns true if one word is the complement of the other.
  #
  #  w1 = Word.new('fizeste')
  #  w2 = Word.new('fizes-te')
  #
  #  Tracinho.pair?(w1, w2)
  #  # => true
  def self.pair?(word1, word2)
    word1 = Word.new(word1) unless word1.is_a?(Word)
    word2 = Word.new(word2) unless word2.is_a?(Word)

    word1.complement.to_s == word2.to_s
  end

  class << self
    alias complementary? pair?
  end
end
