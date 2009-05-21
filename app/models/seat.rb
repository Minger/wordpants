class Seat < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  before_create :set_position

  validates_presence_of :user_id
  validate_on_create :validate_game_status

  private
    def set_position
      self.position = Seat.count(:conditions => {:game_id => self.game_id}) + 1
    end

    def validate_game_status
      if self.game && !self.game.unstarted?
        self.errors.add(:game_id, "must be unstarted")
      end
    end
end
