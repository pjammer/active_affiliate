require File.dirname(__FILE__) + '/test_helper.rb'
include AffiliatesHelper

class AffiliatesHelperTest < Test::Unit::TestCase
  def test_tweet
    assert_equal "Tweet! Hello", tweet("Hello")
  end
end