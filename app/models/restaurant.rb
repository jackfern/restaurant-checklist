class Restaurant < ApplicationRecord
    validates :name, :presence => true

    belongs_to :city_list

    def ate?
        !ate_at.blank?
    end




end
