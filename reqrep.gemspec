require File.expand_path("../lib/reqrep/version", __FILE__)
Gem::Specification.new do |gem|
  gem.name          = "reqrep"
  gem.version       = ReqRep::VERSION
  gem.license       = "MIT"
  gem.authors       = ["Tiago Cardoso"]
  gem.email         = ["cardoso_tiago@hotmail.com"]
  gem.description   = "Request-Response Interface between servers and frameworks"
  gem.summary       = "Read the description"
  gem.homepage      = "http://github.com/TiagoCardos1983/reqrep"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "rake"
end
