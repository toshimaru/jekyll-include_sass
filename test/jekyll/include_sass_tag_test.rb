# frozen_string_literal: true

require 'test_helper'

# https://github.com/jekyll/jekyll/blob/master/test/test_tags.rb
class Jekyll::Tags::IncludeSassTagTest < JekyllUnitTest
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
  
    create_post(content)
    assert_match "font: 100% Helvetica, sans-serif;", @result
  end
  
  private

  def create_post(content)
    site = fixture_site

    info = { filters: [Jekyll::Filters], registers: { site: site } }
    @converter = site.converters.find { |c| c.class == Jekyll::Converters::Markdown }
    payload = { "highlighter_prefix" => @converter.highlighter_prefix,
                "highlighter_suffix" => @converter.highlighter_suffix, 
                "page" => { "css" => "scss_file.scss" } }

    @result = Liquid::Template.parse(content).render!(payload, info)
    @result = @converter.convert(@result)
  end
end
