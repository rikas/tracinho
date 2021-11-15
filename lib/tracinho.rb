# frozen_string_literal: true

require 'tracinho/version'
require 'tracinho/verb_guess'
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
  def self.pair?(first, second)
    first = Word.new(first) unless first.is_a?(Word)
    second = Word.new(second) unless second.is_a?(Word)

    first.complement.to_s == second.to_s
  end

  class << self
    alias complementary? pair?
  end
end
