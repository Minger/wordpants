require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = Factory(:user)
  end

  test "has many seats" do
    assert_respond_to @user, :seats
  end

  test "has many games through seats" do
    assert_respond_to @user, :games
  end
end
