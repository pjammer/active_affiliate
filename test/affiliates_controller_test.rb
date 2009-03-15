require File.dirname(__FILE__) + '/test_helper.rb'
require 'affiliates_controller'
require 'action_controller/test_process'

class AffiliatesController; def rescue_action(e) raise e end; end

class AffiliatesControllerTest < Test::Unit::TestCase
  def setup
    @controller = AffiliatesController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new

    ActionController::Routing::Routes.draw do |map|
      map.resources :affiliates
    end
  end

  def test_index
    get :index
    assert_response :success
  end
    
    def test_show
      get :show
      assert_response :success
    end
    def test_new
      get :new
      assert_response :success
    end
    def test_edit
      get :edit
      assert_response :success
    end
end