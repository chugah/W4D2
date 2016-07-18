class AddUser < ActiveRecord::Base
  has_many :songs
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
=begin 
  def self.check_crediential(username,password)
	username.nil? || password.nil? erb :login : erb :index
  end
	
	unless AddUser.exists?(username:username)
		return false
	end
	user = AddUser.find_by(username:username)
	if password != user.password
		return false
	end
	return true

  end
=end 
end