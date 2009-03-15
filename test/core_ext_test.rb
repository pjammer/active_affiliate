require File.dirname(__FILE__) + '/test_helper.rb'

class CoreExtTest < Test::Unit::TestCase
  def test_to_squawk_prepends_the_word_squawk
    assert_equal "squawk! Hello World", "Hello World".to_squawk
  end
end