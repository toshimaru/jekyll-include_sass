# frozen_string_literal: true

require 'test_helper'

module Jekyll::Tags
  class IncludeScssTagTest < IncludeTagBase
    def test_include_sass
      content = include_sass_file_html('include_scss')
      create_post(content)
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end

    def test_include_scss
      content = include_scss_file_html('include_scss')
      create_post(content)
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end

    def test_read_variable
      content = include_with_variable_html('include_scss')
      create_post(content, { "page" => { "css" => "scss_file.scss" } })
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end
  end
end
