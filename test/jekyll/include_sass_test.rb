require 'test_helper'

class Jekyll::IncludeSassTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::IncludeSass::VERSION
  end

  def test_it_does_something_useful
    refute_nil ::Jekyll::Tags::IncludeSassTag
  end
end
