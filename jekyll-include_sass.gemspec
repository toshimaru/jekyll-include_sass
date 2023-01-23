# frozen_string_literal: true

require_relative 'lib/jekyll/include_sass/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-include_sass"
  spec.version       = Jekyll::IncludeSass::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{Jekyll include_sass tag which aincludes and converts SASS/SCSS file. Useful for AMP HTML!}
  spec.description   = %q{Jekyll include_sass tag is a shorthand tag for including SASS/SCSS file inside head tag. It's useful when you don't want to reference external CSS, for example, in AMP.}
  spec.homepage      = "https://github.com/toshimaru/jekyll-include_sass"
  spec.license       = "MIT"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end

  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'jekyll', '>= 3.9'
end
