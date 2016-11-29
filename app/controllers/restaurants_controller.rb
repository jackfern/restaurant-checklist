class RestaurantsController < ApplicationController
    before_action :set_city_list
    before_action :set_restaurant, except: [:create]

    def create
        @restaurant = @city_list.restaurants.create(restaurant_params)
        @uneaten_restaurant = @restaurant
        redirect_to @city_list
    end

    def destroy
        if @restaurant.destroy
            flash[:success] = "Restaurant was deleted"
        else
            flash[:error] = "Restaurant could not be deleted"
        end
        redirect_to @city_list
    end

    def eat_and_liked
        @restaurant.update_attribute(:ate_at, Time.now)
        @restaurant.update_attribute(:liked_it, true)
        redirect_to @city_list
    end

    def eat_and_didnt_like
        @restaurant.update_attribute(:ate_at, Time.now)
        @restaurant.update_attribute(:liked_it, false)
        redirect_to @city_list
    end

    private

    def set_restaurant
        @restaurant = @city_list.restaurants.find(params[:id])
    end

    def set_city_list
        @city_list = CityList.find(params[:city_list_id])
    end

    def restaurant_params
        params[:restaurant].permit(:name, :address, :description)
    end
end
