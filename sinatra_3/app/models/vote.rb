class Vote < ActiveRecord::Base
  has_many :songs
  has_many :users

  validate :no_repeat_votes

  def no_repeat_votes
    @votes = Vote.all
    @votes.each do |vote|
      if vote.track_id == track_id && vote.user_id == user_id
        errors.add(:user_id, "You cannot vote twice for the same song.")  
      end
    end
  end  
end