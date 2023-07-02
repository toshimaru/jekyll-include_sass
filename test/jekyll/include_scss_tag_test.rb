# frozen_string_literal: true

require 'test_helper'

# ref. https://github.com/jekyll/jekyll/blob/master/test/helper.rb
class Jekyll::Tags::IncludeSassTagTest < JekyllUnitTest
  def test_include_sass
    content = <<~HTML
      <html>
      <head>
        <meta charset="utf-8">
        <style type="text/css">
        {% include_scss sass_file.sass %}
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
        {% include_scss scss_file.scss %}
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
        {% include_scss {{ page.css }} %}
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

  private

  def create_post(content, override = {})
    site = fixture_site
    @result = render_with(site, content, override)
  end

  def render_with(site, content, override = {})
    converter = site.converters.find { |c| c.instance_of?(Jekyll::Converters::Markdown) }
    payload   = { "highlighter_prefix" => converter.highlighter_prefix,
                  "highlighter_suffix" => converter.highlighter_suffix, }.merge(override)
    info = { :registers => { :site => site } }
    converter.convert(
      Liquid::Template.parse(content).render!(payload, info)
    )
  end
end
