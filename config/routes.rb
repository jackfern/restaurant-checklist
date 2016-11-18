Rails.application.routes.draw do
  resources :city_lists do
      resources :restaurants do
          member do
              patch :eat
          end
      end
  end

  root "city_lists#index"
end
