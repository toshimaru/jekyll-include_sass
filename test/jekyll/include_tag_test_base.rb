# frozen_string_literal: true

require 'test_helper'

# ref. https://github.com/jekyll/jekyll/blob/@/test/helper.rb
module Jekyll::Tags
  class IncludeTagBase < JekyllUnitTest
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
end
