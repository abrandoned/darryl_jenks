# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'daryl_jenks/version'

Gem::Specification.new do |spec|
  spec.name          = "daryl_jenks"
  spec.version       = DarylJenks::VERSION
  spec.authors       = ["Brandon Dewitt"]
  spec.email         = ["brandonsdewitt@gmail.com"]
  spec.description   = %q{ Calculates the permutations of a strings based on a key string / regex }
  spec.summary       = %q{ Just here to perm it up! }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
