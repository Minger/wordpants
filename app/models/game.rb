class Game < ActiveRecord::Base
  include AASM

  has_many :seats
  has_many :users, :through => :seats
  has_one  :board
  accepts_nested_attributes_for :seats

  validates_presence_of :name
  validates_associated :seats

  aasm_column :status
  aasm_initial_state :unstarted
  aasm_state :unstarted
  aasm_state :started
  aasm_event :start do
    transitions :to => :started, :from => [:unstarted]
  end
end
