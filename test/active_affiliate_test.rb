require File.dirname(__FILE__) + '/test_helper.rb'

class ActiveAffiliateTest < Test::Unit::TestCase
  load_schema

  class Affiliate < ActiveRecord::Base
  end

  def test_schema_has_loaded_correctly
    assert_equal [], Affiliate.all
  end

end