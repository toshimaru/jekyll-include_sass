# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'jekyll-include_sass'

require 'minitest/autorun'

# ref. https://github.com/jekyll/jekyll/blob/master/test/helper.rb
module DirectoryHelpers
  def dest_dir(*subdirs)
    test_dir('dest', *subdirs)
  end

  def source_dir(*subdirs)
    test_dir('source', *subdirs)
  end

  def test_dir(*subdirs)
    File.join(File.dirname(__FILE__), *subdirs)
  end
end

class JekyllUnitTest < Minitest::Test
  include Jekyll
  include DirectoryHelpers

  private

  def fixture_site(overrides = {})
    Jekyll::Site.new(site_configuration(overrides))
  end

  def build_configs(overrides, base_hash = Jekyll::Configuration::DEFAULTS)
    Utils.deep_merge_hashes(base_hash, overrides)
  end

  def site_configuration(overrides = {})
    full_overrides = build_configs(overrides, build_configs(
                                                "destination" => dest_dir,
                                                "incremental" => false
                                              ))
    Configuration.from(full_overrides.merge(
                         "source" => source_dir
                       ))
  end

  def dest_dir(*subdirs)
    test_dir('dest', *subdirs)
  end

  def source_dir(*subdirs)
    test_dir('source', *subdirs)
  end

  def test_dir(*subdirs)
    File.join(File.dirname(__FILE__), *subdirs)
  end
end
