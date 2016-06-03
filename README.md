[![Gem Version](https://badge.fury.io/rb/jekyll-include_sass.svg)](https://badge.fury.io/rb/jekyll-include_sass)
[![Build Status](https://travis-ci.org/toshimaru/jekyll-include_sass.svg)](https://travis-ci.org/toshimaru/jekyll-include_sass)

# Jekyll::IncludeSass

Jekyll include_sass tag which includes and converts SASS/SCSS file.

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

### HTML version

Add the following inside `<head>` in your site's template(s):

```html
<style type="text/css">
{% include_sass style.scss %}
</style>
```

### AMP version

```html
<style amp-custom>
{% include_sass style.scss %}
</style>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/jekyll-include_sass.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
