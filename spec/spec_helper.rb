require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'tracinho'
require 'rspec'

RSpec.configure do |config|
  include Tracinho

  config.order = 'random'
end