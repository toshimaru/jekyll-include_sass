# frozen_string_literal: true

require 'test_helper'

# ref. https://github.com/jekyll/jekyll/blob/@/test/helper.rb
module Jekyll::Tags
  class IncludeTagBase < JekyllUnitTest
    private

    def include_sass_file_html(include_tag)
      <<~HTML.freeze
        <html>
        <head>
          <meta charset="utf-8">
          <style type="text/css">
          {% #{include_tag} sass_file.sass %}
          </style>
        </head>
        <body>HTML Body</body>
        </html>
      HTML
    end

    def include_scss_file_html(include_tag)
      <<~HTML.freeze
        <html>
        <head>
          <meta charset="utf-8">
          <style type="text/css">
          {% #{include_tag} scss_file.scss %}
          </style>
        </head>
        <body>HTML Body</body>
        </html>
      HTML
    end

    def include_with_variable_html(include_tag)
      <<~HTML.freeze
        <html>
        <head>
          <meta charset="utf-8">
          <style type="text/css">
          {% #{include_tag} {{ page.css }} %}
          </style>
        </head>
        <body>Your reading stylesheet is {{ page.css }}.</body>
        </html>
      HTML
    end

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
end
