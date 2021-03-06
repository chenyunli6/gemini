$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gemini/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gemini"
  s.version     = Gemini::VERSION
  s.authors     = ["Chen Yunli"]
  s.email       = ["18301662790@163.com"]
  s.homepage    = "http://www.jiaji.com"
  s.summary     = "Summary of Gemini."
  s.description = "Description of Gemini."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails', '~> 5.0.3'
  s.add_dependency 'bootstrap-sass', '~> 3'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'uglifier', '>= 1.3.0'
  s.add_dependency 'coffee-rails', '~> 4.2'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'turbolinks', '~> 5'

  s.add_development_dependency "sqlite3"
end
