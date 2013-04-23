# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spree_bcash/version"

Gem::Specification.new do |s|
  s.name        = "spree_bcash"
  s.version     = SpreeBcash::VERSION
  s.authors     = ["Matheus Caceres"]
  s.email       = ["matheus@formaweb.com.br"]
  s.homepage    = ""
  s.summary     = %q{Support bcash in spree. Base: spree_pag_seguro}
  s.description = %q{Support bcash}

  s.rubyforge_project = "spree_bcash"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'bcash', '~> 2.0.0'
  s.add_dependency 'spree_core'

  # specify any dependencies here; for example:
   s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
