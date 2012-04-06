# -*- encoding: utf-8 -*-
require File.expand_path('../lib/transliterator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tom-Eric Gerritsen"]
  gem.email         = ["tomeric@eet.nu"]
  gem.description   = <<-EOD
    A library for translating UTF-8 characters to their ASCII equivalents. This
    library is based on code from the babosa gem and meant for projects that
    only need the transliterator functionality.
  EOD
  
  gem.summary       = %q{A ruby library for translating UTF-8 characters to their ASCII equivalents.}
  gem.homepage      = "https://github.com/eet-nu/transliterator"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "transliterator"
  gem.require_paths = ["lib"]
  gem.version       = Transliterator::VERSION
end
