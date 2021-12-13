class Auction < ApplicationRecord
	validates_presence_of :title
	validates_presence_of :description
	validates_presence_of :start
	validates_presence_of :end
end
