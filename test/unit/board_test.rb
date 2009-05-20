require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  def setup
    @board = Factory(:board)
  end

  test "belongs to game" do
    assert_respond_to @board, :game
  end
end
