$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gemini/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gemini"
  s.version     = Gemini::VERSION
  s.authors     = ["Chen Yunli"]
  s.email       = ["18301662790@163.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Gemini."
  s.description = "TODO: Description of Gemini."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.3"

  s.add_development_dependency "sqlite3"
end
