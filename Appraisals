# frozen_string_literal: true

# NOTE: Test against jekyll-4.0 fails, so exclude it from supported versions.
SUPPORTED_VERSIONS = %w[3.9 4.1 4.2 4.3].freeze

SUPPORTED_VERSIONS.each do |version|
  appraise "jekyll-#{version}" do
    gem 'jekyll', version
    gem 'kramdown-parser-gfm' if version == '3.9'
  end
end
