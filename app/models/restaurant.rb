class Restaurant < ApplicationRecord
    belongs_to :city_list

    def ate?
        !ate_at.blank?
    end




end
