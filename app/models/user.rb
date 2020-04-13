class User < ApplicationRecord
	has_many :gardens
  validates_presence_of :name, :email, :google_token
  validates :email, uniqueness: true
  
  def self.from_omniauth(auth)
    where(email: auth["info"]["email"]).first_or_initialize do |user|
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end

end
