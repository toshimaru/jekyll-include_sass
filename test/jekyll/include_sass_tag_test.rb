# frozen_string_literal: true

require 'test_helper'

module Jekyll::Tags
  class IncludeSassTagTest < IncludeTagBase
    def test_include_sass
      content = include_sass_file_html('include_sass')
      create_post(content)
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end

    def test_include_scss
      content = include_scss_file_html('include_sass')
      create_post(content)
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end

    def test_read_variable
      content = include_with_variable_html('include_sass')
      create_post(content, { "page" => { "css" => "sass_file.sass" } })
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end
  end
end
