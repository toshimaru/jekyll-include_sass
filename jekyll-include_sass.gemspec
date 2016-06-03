lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/include_sass/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-include_sass"
  spec.version       = Jekyll::IncludeSass::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{Jekyll include_sass tag which aincludes and converts SASS/SCSS file. Useful for AMP HTML!}
  spec.description   = %q{Jekyll include_sass tag is a shorthand tag for including SASS/SCSS file inside head tag. It's useful when you don't want to reference external CSS, for example, in AMP.}
  spec.homepage      = "https://github.com/toshimaru/jekyll-include_sass"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", "~> 3.0"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
end
