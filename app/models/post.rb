class Post < ActiveRecord::Base
	validates :place, presence: true
	validates :neighborhood, presence: true
	validates :when, presence: true
	validates :description, presence: true
end
