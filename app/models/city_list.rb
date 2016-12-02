class CityList < ApplicationRecord
    validates :city, :presence => true
    has_many :restaurants
end
