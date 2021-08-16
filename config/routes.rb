Rails.application.routes.draw do
  resources :boards do
    resources :posts
      get :search_by_time
  end
end
