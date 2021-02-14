Gem::Specification.new do |s|
  s.name          = "ruby_utils"
  s.version       = "0.1.1"
  s.summary       = "Ruby utils collection"
  s.description   = "Collection of common scripts and data structures for usage in other ruby projects"
  s.authors       = ["Benjamin Held"]
  s.email         = "me@bheld.eu"
  s.homepage      = "https://github.com/settraziel/ruby_utils"
  s.licenses      = "MIT"

  s.files         = Dir["lib/**/*.rb"] + ["README.md", "LICENSE"]
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 2.4"

  s.add_development_dependency "rake",      '~> 13.0', '>= 13.0.1'
  s.add_development_dependency "rspec", '~> 3.9', '>= 3.9.0'
end
