require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user session" do
    post :create, :user_session => { :login => "huge", :password => "small" }
    assert user_session = UserSession.find
    assert_equal users(:huge), user_session.user
    assert_redirected_to root_url
  end

  test "should destroy user session" do
    delete :destroy
    assert_nil UserSession.find
    assert_redirected_to new_user_session_path
  end
end
