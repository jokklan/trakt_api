# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "trakt/version"

Gem::Specification.new do |s|
  s.name        = "trakt_api"
  s.version     = Trakt::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Johan Frølich"]
  s.email       = ["johan@pylonweb.dk"]
  s.homepage    = "https://github.com/TheMaster/trakt_api"
  s.summary     = %q{Use the Trakt API from Ruby}
  s.description = %q{Utilize the Trakt API from Ruby to fetch shows, track updates to the tvdb and sync your media database}
  s.rubyforge_project = "trakt_api"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "hashie"
  s.add_dependency "httparty"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
end
