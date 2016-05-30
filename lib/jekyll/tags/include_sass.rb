module Jekyll
  module Tags
    class IncludeSassTag < IncludeTag
      include Jekyll::Filters

      def render(context)
        @context = context

        case File.extname(@file)
        when '.sass'
          sassify(super)
        when '.scss'
          scssify(super)
        else
          raise "invalid!" # TODO
        end
      end
    end
  end
end

Liquid::Template.register_tag("include_sass", Jekyll::Tags::IncludeSassTag)
