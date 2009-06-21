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
    game.save
    assert_equal 2, game.seats.count
  end

  test "has one board" do
    assert_respond_to @game, :board
  end

  test "has an initial state of unstarted" do
    assert_equal 'unstarted', @game.status
  end

  test "can be started" do
    @game.start!
    assert_equal 'started', @game.reload.status
  end

  test "requires name" do
    @game.name = nil
    assert !@game.valid?
  end

  test "requires no more than 4 seats" do
    users = Array.new(5) { Factory(:user) }
    game  = Game.create({
      :name => 'pantalones',
      :seats_attributes => {
        1 => { :user => users[0] },
        2 => { :user => users[1] },
        3 => { :user => users[2] },
        4 => { :user => users[3] },
        5 => { :user => users[4] }
      }
    })
    assert !game.valid?
  end

  test "requires at least 2 seats" do
    game  = Game.create({
      :name => 'pantalones',
      :seats_attributes => {
        1 => { :user => Factory(:user) }
      }
    })
    assert !game.valid?
  end

  test "has a bag of letters" do
    letters = ("a".."z").inject("") {|s,l| s<<(l*Letters::INFO[l][:total])}
    assert_equal letters + "__", @game.letters_remaining
  end

  test "distributes letters to seats on start" do
    count = @game.letters_remaining.length
    @game.start!
    @game.seats.each do |seat|
      assert_match /^[a-z_]{7}$/, seat.letters
    end
    assert_equal (count - @game.seats.count * 7), @game.letters_remaining.length
  end
end
