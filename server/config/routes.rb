Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :signup
      resources :signin
      resources :signout

      namespace :admin do
        resources :signin
        resources :products
        resources :categorys, param: :slug, constraints: { slug: /[^\/]+/ }
        resources :coupons
      end
    end
  end
end
