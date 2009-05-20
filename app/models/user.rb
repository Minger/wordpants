class User < ActiveRecord::Base
  acts_as_authentic
  has_many :seats
  has_many :games, :through => :seats
end
