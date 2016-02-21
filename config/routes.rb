Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  #
  authenticated :user do
    get '/auth/:provider/callback' => 'plugins#oauth_callback'

    get 'plugins/:id/enable' => 'plugins#enable', as: :plugin_enable
    get 'plugins/:id/disable' => 'plugins#disable', as: :plugin_disable
    resources :plugins, only: [:index]
    resources :payables, except: :show
    resources :payable_items, only: [] do
      patch :mark_as_paid, on: :member
    end

    root 'dashboard#index', as: :dashboard
  end

  root 'landing#index'
end
