lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tracinho/version'

Gem::Specification.new do |spec|
  spec.name          = 'tracinho'
  spec.version       = Tracinho::VERSION
  spec.authors       = ['Ricardo Otero']
  spec.email         = ['oterosantos@gmail.com']
  spec.summary       = 'Tracinho.com gem.'
  spec.homepage      = 'https://github.com/rikas/tracinho'
  spec.license       = 'MIT'
  spec.description   = 'This gem converts words with dash in the version without it and vice-versa.
                        It also gets the verb name from a word and gives the full grammar
                        classification of the verb.'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rubocop', '~> 0.35'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'simplecov', '~> 0.10'
end
