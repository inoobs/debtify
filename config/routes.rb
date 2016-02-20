Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  #
  authenticated :user do
    resources :payables, except: :show

    root 'dashboard#index', as: :dashboard
  end

  root 'landing#index'
end
