# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "champagne/version"

Gem::Specification.new do |s|
  s.name        = "champagne"
  s.version     = Champagne::VERSION
  s.authors     = ["Brad Gessler"]
  s.email       = ["brad@bradgessler.com"]
  s.homepage    = ""
  s.summary     = %q{The fastest way to get code into production  }
  s.description = %q{Champagne is a server that quite simply runs long-running terminal commands reliably. Chain these commands together and you can build a workflow that tests code and moves it to production.}

  s.rubyforge_project = "champagne"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "thin"
  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "eventmachine"
end