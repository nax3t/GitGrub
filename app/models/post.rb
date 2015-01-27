class Post < ActiveRecord::Base
	validates :place, presence: true
	# validates :time, presence: true
	validates :body, presence: true
	validates :neighborhood, presence: true
	belongs_to :user
end
