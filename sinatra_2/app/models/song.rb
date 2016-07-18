class Song < ActiveRecord::Base
  belongs_to :add_user

  validates :title, presence: true, length: { maximum: 50 }
  validates :artist, presence: true, length: { maximum: 50 }
  validates :url , :url => false

end