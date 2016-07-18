class Message < ActiveRecord::Base

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }
  validates :url, :url => true

end