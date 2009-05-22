require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  def setup
    activate_authlogic
    @user = Factory(:user)
    UserSession.create(@user)
  end

  test "should require login" do
    UserSession.find.destroy
    get :index
    assert_redirected_to new_user_session_url
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should find user games for index" do
    game_1 = Factory(:game)
    game_2 = Factory(:game)
    seat = Factory(:seat, :user => @user, :game => game_2)
    get :index
    assert_equal [game_2], assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should find users for new" do
    get :new
    assert_equal [users(:huge)], assigns(:users)
  end

  test "should redirect to index if there are no users for new" do
    users(:huge).destroy
    get :new
    assert_redirected_to games_path
  end

  test "should create and start game" do
    assert_difference('Game.count') do
      post :create, :game => {:name => 'Huge'}
    end
    assert assigns(:game).started?
    assert_redirected_to game_path(assigns(:game))
  end

  test "should find users for failed create" do
    post :create, :game => {}
    assert_equal [users(:huge)], assigns(:users)
  end

  test "should show game" do
    get :show, :id => Factory(:game).to_param
    assert_response :success
  end

  test "should not get edit" do
    assert_raise ActionController::UnknownAction do
      get :edit, :id => Factory(:game).to_param
    end
  end

  test "should not update game" do
    assert_raise ActionController::UnknownAction do
      put :update, :id => Factory(:game).to_param, :game => { }
    end
  end

  test "should not destroy game" do
    assert_raise ActionController::UnknownAction do
      delete :destroy, :id => Factory(:game).to_param
    end
  end
end
