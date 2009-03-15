require File.dirname(__FILE__) + '/test_helper.rb'

class AffiliateTest < Test::Unit::TestCase
  load_schema

  def test_affiliate
    assert_kind_of Affiliate, Affiliate.new
  end
end