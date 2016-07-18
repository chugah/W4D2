class Track < ActiveRecord::Base
  has_many :votes
  has_many :reviews
end