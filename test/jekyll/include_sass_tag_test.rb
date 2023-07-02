# frozen_string_literal: true

require 'test_helper'

module Jekyll::Tags
  class IncludeSassTagTest < IncludeTagBase
    def test_include_sass
      content = <<~HTML
        <html>
        <head>
          <meta charset="utf-8">
          <style type="text/css">
          {% include_sass sass_file.sass %}
          </style>
        </head>
        <body>
        </body>
        </html>
      HTML

      create_post(content)
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end

    def test_include_scss
      content = <<~HTML
        <html>
        <head>
          <meta charset="utf-8">
          <style type="text/css">
          {% include_sass scss_file.scss %}
          </style>
        </head>
        <body>
        </body>
        </html>
      HTML

      create_post(content)
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end

    def test_read_variable
      content = <<~HTML
        <html>
        <head>
          <meta charset="utf-8">
          <style type="text/css">
          {% include_sass {{ page.css }} %}
          </style>
        </head>
        <body>
          Your reading stylesheet is {{ page.css }}.
        </body>
        </html>
      HTML

      create_post(content, { "page" => { "css" => "scss_file.scss" } })
      assert_match "font: 100% Helvetica, sans-serif;", @result
    end
  end
end
