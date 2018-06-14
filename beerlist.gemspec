require_relative './lib/beerlist.rb'

Gem::Specification.new do |s|
  s.name        = 'beerlist'
  s.version     =  '0.0.0'
  s.date        = '2018-06-14'
  s.summary     = "mmm beer"
  s.description = "provides seperate beer lists based on region and style"
  s.authors     = ["Eric DeSimone"]
  s.email       = 'eric.desimone@cortland.edu '
  s.files       = ["lib/beers.rb", "config/environment.rb", "lbi/cli.rb", "lib/regions.rb", "lib/styles.rb", "lib/scraper.rb"]
  s.homepage    = 'http://rubygems.org/gems/beerlist'
  s.license     = 'MIT'
  s.executables << 'beerlist'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
  s.add_development_dependency "require_all", ">=0"
end
