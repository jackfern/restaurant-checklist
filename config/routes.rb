Rails.application.routes.draw do
  resources :city_lists do
      resources :restaurants do
          member do
              patch :eat_and_didnt_like
              patch :eat_and_liked
          end
      end
  end

  root "city_lists#index"
end
