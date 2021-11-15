# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'tracinho'
require 'rspec'

RSpec.configure do |config|
  config.order = 'random'
end
