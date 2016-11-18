class RestaurantsController < ApplicationController
    before_action :set_city_list


    def create
        @restaurant = @city_list.restaurants.create(restaurant_params)
        redirect_to @city_list
    end

    def destroy
        @restaurant = @city_list.restaurants.find(params[:id])
        if @restaurant.destroy
            flash[:success] = "Restaurant was deleted"
        else
            flash[:error] = "Restaurant could not be deleted"
        end
        redirect_to @city_list
    end

    private

    def set_city_list
        @city_list = CityList.find(params[:city_list_id])
    end

    def restaurant_params
        params[:restaurant].permit(:name, :address, :description)
    end
end
