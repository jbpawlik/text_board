Rails.application.routes.draw do
  resources :boards do
    resources :messages
  end
end
