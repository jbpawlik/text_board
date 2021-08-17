Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => { :registrations => 'registrations' }

  # root to: 'devise/registrations#new'

  devise_scope :user do
    root to: 'devise/registrations#new'
  end

  # resources :boards do
  #   resources :posts
  #     get :search_by_time
  # end

  namespace :api do
    resources :users, only: %i[create]
    resources :boards, only: %i[index] do
      resources :posts
        get :search_by_time
    end
  end

  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
end

#<Doorkeeper::Application id: 1, name: "Android client", uid: "ghdMcLIe_QbR6dFlQyK2xMi932wb7IRxvhuJr-mn6pA", secret: "C2nColjs-5K2iWV8CNawsjjgwdsHafMkxx18S4AB1TA", redirect_uri: "", scopes: "", confidential: true, created_at: "2021-08-17 17:50:28", updated_at: "2021-08-17 
# 17:50:28">

# "access_token": "Xw0wdWH6G5fCM8aQYXaRuuPUP3rIRCyHMOZj8T2-KsM",
#     "token_type": "Bearer",
#     "expires_in": 7200,
#     "refresh_token": "DvutMdtA78g1njHr6trCe39tITaR2YBSvsr8Xi0R_eI",
#     "created_at": 1629223510

# User.create!({:email => 'fake@fake.com', :password => 'password', :password_confirmation => 'password'})