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

  test "sets position before create" do
    game = Factory(:game)
    assert_equal 1, game.seats[0].position
    assert_equal 2, game.seats[1].position
  end

  # most of the time seats will be created at the same time as a game, via
  # nested attributes; if Seat#game_id is required, the game fails validation
  # and it doesn't work
#  test "should require game" do
#    seat = Factory.build(:seat, :game => nil)
#    assert !seat.valid?
#  end

  test "requires user" do
    seat = Factory.build(:seat, :user => nil)
    assert !seat.valid?
  end

  test "requires the game be unstarted" do
    game = Factory(:game)
    game.start!
    seat = Factory.build(:seat, :game => game)
    assert !seat.valid?
  end

  test "requires no more than 4 seats per game" do
    game = Factory(:game)
    2.times { Factory(:seat, :game => game) }
    seat = Factory.build(:seat, :game => game)
    assert !seat.valid?
  end
end
