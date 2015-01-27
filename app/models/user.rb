class User < ActiveRecord::Base
	validates :provider, presence: true
	validates :uid, presence: true
	validates :name, presence: true

	def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
    end
  end
end