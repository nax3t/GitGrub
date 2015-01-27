class Post < ActiveRecord::Base
	validates :place, presence: true
	validates :time, presence: true
	validates :body, presence: true
	validates :user_id, presence: true
	validates :neighborhood, presence: true
end
