require 'test_helper'

class SeatTest < ActiveSupport::TestCase
  def setup
    @seat = Factory(:seat)
  end

  test "belongs to user" do
    assert_respond_to @seat, :user
  end

  test "belongs to game" do
    assert_respond_to @seat, :game
  end
end
