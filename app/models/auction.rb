class Auction < ApplicationRecord
	belongs_to :user, optional: true
	validates_presence_of :title, :description, :start, :end
end
