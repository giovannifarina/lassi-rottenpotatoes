class Moviegoer < ApplicationRecord
    has_many :reviews
	has_many :movies, :through => :reviews

    validate :name, uniqueness: true
end