# frozen_string_literal: true

require 'test_helper'

class Jekyll::Tags::IncludeSassTagTest < JekyllUnitTest
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::IncludeSass::VERSION
  end

  def test_it_does_something_useful
    refute_nil ::Jekyll::Tags::IncludeSassTag
  end

  def test_include_sass
    content = <<CONTENT
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
CONTENT

    create_post(content, { "read_posts" => true })
    assert_match "font: 100% Helvetica, sans-serif;", @result
  end

  def test_include_scss
    content = <<CONTENT
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
CONTENT

    create_post(content, { "read_posts" => true })
    assert_match "font: 100% Helvetica, sans-serif;", @result
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
