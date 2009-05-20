class Game < ActiveRecord::Base
  has_many :seats
  has_many :users, :through => :seats
  has_one  :board
  accepts_nested_attributes_for :seats
end
