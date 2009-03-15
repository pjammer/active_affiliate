require "#{File.dirname(__FILE__)}/test_helper"

class RoutingTest < Test::Unit::TestCase

  def setup
    ActionController::Routing::Routes.draw do |map|
      map.affiliates
    end
  end

  def test_affiliates_route
    assert_recognition :get, "/affiliates", :controller => "affiliates_controller", :action => "index"
    assert_recognition :get, "/affiliates/new", :controller => "affiliates_controller", :action => "new"
    assert_recognition :get, "/affiliates/1", :controller => "affiliates_controller", :action => "show", :id => "1"
     assert_recognition :get, "/affiliates/edit/1", :controller => "affiliates_controller", :action => "edit", :id => "1"
  end

  private

    def assert_recognition(method, path, options)
      result = ActionController::Routing::Routes.recognize_path(path, :method => method)
      assert_equal options, result
    end
end