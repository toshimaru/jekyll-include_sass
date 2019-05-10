# frozen_string_literal: true

module Jekyll
  module Tags
    class IncludeSassTag < IncludeTag
      include Jekyll::Filters

      def render(context)
        file = render_variable(context) || @file
        validate_file_name(file)

        @context = context

        case File.extname(file)
        when '.sass'
          sassify(super)
        when '.scss'
          scssify(super)
        else
          raise "Invalid file extension. Please specify sass or scss as a file."
        end
      end
    end
  end
end

Liquid::Template.register_tag("include_sass", Jekyll::Tags::IncludeSassTag)
