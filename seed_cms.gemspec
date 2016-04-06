$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seed_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seed_cms"
  s.version     = SeedCms::VERSION
  s.authors     = ["Will Schenk"]
  s.email       = ["will@happyfuncorp.com"]
  s.homepage    = "http://seed.happyfuncorp.com"
  s.summary     = "Port of wellspring."
  s.description = "Build content with content forms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.beta3", "< 5.1"
  s.add_dependency "cancancan"
  s.add_dependency "haml-rails"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "ckeditor"
  s.add_dependency "momentjs-rails"#, '>= 2.9.0'
  s.add_dependency 'bootstrap3-datetimepicker-rails'#, '~> 4.17'

  s.add_development_dependency "sqlite3"  
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec-autotest"
  s.add_development_dependency "autotest-rails"
  s.add_development_dependency 'factory_girl_rails'

end
