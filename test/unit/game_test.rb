require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @game = Factory(:game)
  end

  test "has many seats" do
    assert_respond_to @game, :seats
  end

  test "has many users through seats" do
    assert_respond_to @game, :users
  end

  test "accepts nested attributes for seats" do
    user_1 = Factory(:user)
    user_2 = Factory(:user)
    game = Game.create({
      :name => 'pantalones',
      :seats_attributes => {
        1 => { :user => user_1 },
        2 => { :user => user_2 }
      }
    })
    assert game.valid?
    assert_equal 2, game.seats.count
  end

  test "has one board" do
    assert_respond_to @game, :board
  end
end
