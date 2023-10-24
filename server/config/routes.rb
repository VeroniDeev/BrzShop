Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :signup
      resources :signin
      resources :signout
    end
  end
end
