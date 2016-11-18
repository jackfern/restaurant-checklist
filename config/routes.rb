Rails.application.routes.draw do
  resources :city_lists do
      resources :restaurants
  end

  root "city_lists#index"
end
