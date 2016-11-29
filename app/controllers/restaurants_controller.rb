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
        @eaten_restaurant_and_liked = @restaurant
        redirect_to @city_list, notice: "Restaurant ate at"
    end

    def eat_and_didnt_like
        @restaurant.update_attribute(:ate_at, Time.now)
        @eaten_restaurant_and_didnt_like = @restaurant
        redirect_to @city_list, notice: "Restaurant ate at"
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
