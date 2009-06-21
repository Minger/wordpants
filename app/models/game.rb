class Game < ActiveRecord::Base
  include AASM

  has_many :seats
  has_many :users, :through => :seats
  has_one  :board
  accepts_nested_attributes_for :seats

  validates_presence_of :name
  validates_associated :seats
  validates_length_of :seats, :in => 2..4

  aasm_column :status
  aasm_initial_state :unstarted
  aasm_state :unstarted
  aasm_state :started
  aasm_event :start do
    transitions({
      :to => :started, :from => [:unstarted],
      :on_transition => :deal_letters
    })
  end

  before_create :set_letters_remaining

  private
    def set_letters_remaining
      letters = ("a".."z").to_a + ["_"]
      self.letters_remaining = letters.inject("") do |str, letter|
        str << (letter * Letters::INFO[letter][:total])
      end
    end

    def deal_letters
      bag = self.letters_remaining.split(//)
      self.seats.each do |seat|
        x = (1..7).inject("") {|s,i| s << bag.delete_at(rand(bag.length))}
        seat.update_attribute(:letters, x)
      end
      update_attribute(:letters_remaining, bag.join)
    end
end
