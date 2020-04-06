# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  namespace 'auth' do
    get :confirmation_success, to: 'info#confirmation_success'
  end

  namespace 'api' do
    resources :posts, only: %i[create index] do
      member do
        put :react
      end
    end
  end
end
