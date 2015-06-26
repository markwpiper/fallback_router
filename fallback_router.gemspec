$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fallback_router/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fallback_router"
  s.version     = FallbackRouter::VERSION
  s.authors     = ["Mark Piper"]
  s.email       = ["mark@lishfood.com"]
  s.homepage    = "http://github.com/markwpiper/fallback_router"
  s.summary     = "Rails engine that allows user-specified fallback routing rules"
  s.description = "Rails engine that allows user-specified fallback routing rules, evaluated after all other routing rules for the application and other engines have finished."

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0"
end
