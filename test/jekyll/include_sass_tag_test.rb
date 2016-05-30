require 'test_helper'

class Jekyll::Tags::IncludeSassTagTest < JekyllUnitTest
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::IncludeSass::VERSION
  end

  def test_it_does_something_useful
    refute_nil ::Jekyll::Tags::IncludeSassTag
  end

# WIP

  def test_include_sass
    content = <<CONTENT
---
title: include_sass test
---
{% include_sass sass_file.sass %}
CONTENT

    create_post(content, { "read_posts" => true })

    assert_match "sass_file", @result
  end

  def create_post(content, override = {}, converter_class = Jekyll::Converters::Markdown)
    site = fixture_site

    info = { :filters => [Jekyll::Filters], :registers => { :site => site } }
    @converter = site.converters.find { |c| c.class == converter_class }
    payload = { "highlighter_prefix" => @converter.highlighter_prefix,
                "highlighter_suffix" => @converter.highlighter_suffix }

    @result = Liquid::Template.parse(content).render!(payload, info)
    @result = @converter.convert(@result)
  end
end
