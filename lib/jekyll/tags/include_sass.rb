module Jekyll
  module Tags
    class IncludeSassTag < IncludeTag
    end
  end
end

Liquid::Template.register_tag("include_sass", Jekyll::Tags::IncludeSassTag)
