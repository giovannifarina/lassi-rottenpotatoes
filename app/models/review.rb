class Review < ApplicationRecord
    belongs_to :movie
	belongs_to :moviegoer
end