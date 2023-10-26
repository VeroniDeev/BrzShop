Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :signup
      resources :signin

      namespace :data do
        resources :products,  param: :slug, constraints: { slug: /[^\/]+/ }
        resources :categorys,  param: :slug, constraints: { slug: /[^\/]+/ }
      end

      namespace :admin do
        resources :signin
        resources :products, param: :slug, constraints: { slug: /[^\/]+/ }
        resources :categorys, param: :slug, constraints: { slug: /[^\/]+/ }
        resources :coupons, param: :slug, constraints: { slug: /[^\/]+/ }
      end
    end
  end
end
