[![Gem Version](https://badge.fury.io/rb/jekyll-include_sass.svg)](https://badge.fury.io/rb/jekyll-include_sass)
[![CI](https://github.com/toshimaru/jekyll-include_sass/actions/workflows/ci.yml/badge.svg)](https://github.com/toshimaru/jekyll-include_sass/actions/workflows/ci.yml)

# Jekyll::IncludeSass

Jekyll `include_sass` tag which includes and converts SASS/SCSS file. This is useful for Google AMP HTML.

## Supported CSS in AMP

> Like all web pages, AMP pages are styled with CSS, but you can’t reference external stylesheets.

> All styles must live in the head of the document.

via. [Supported CSS](https://www.ampproject.org/docs/guides/responsive/style_pages.html)

## Installation

1. Add the following to your site's `Gemfile`:

  ```ruby
  gem 'jekyll-include_sass'
  ```

2. Add the following to your site's `_config.yml`:

  ```yml
  gems:
    - jekyll-include_sass
  ```

## Usage

Put your `style.scss` in Jekyll's `_includes` directory.

### for HTML

Add the following inside `<head>` in your site's template(s):

```html
<style type="text/css">
{% include_sass style.scss %}
</style>
```

### for AMP

```html
<style amp-custom>
{% include_sass style.scss %}
</style>
```

### SASS/SCSS Supported

You can include either SASS or SCSS with `include_sass` depending on extension.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/jekyll-include_sass.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
