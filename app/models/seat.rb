class Seat < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  before_create :set_position

  validates_presence_of :user_id
  validates_each :game_id, :on => :create do |record, attr, value|
    if value
      game = record.game
      record.errors.add(:game_id, "must be unstarted")  if !game.unstarted?
      if game.seats.count == 4
        record.errors.add(:game_id, "cannot have more than 4 seats")
      end
    end
  end

  private
    def set_position
      self.position = Seat.count(:conditions => {:game_id => self.game_id}) + 1
    end
end
