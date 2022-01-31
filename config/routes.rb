require "sidekiq/web"

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 Sidekiq::Web.use ActionDispatch::Cookies
 Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"
  mount Sidekiq::Web => "/sidekiq" 
  resources :applications, param: :access_token, only: [:index,:create] do
    resources :chats, param: :access_token, only: [:index, :create] do
      resources :messages, param: :chat_id, only: [:index, :create, :search] do
         collection do
          get :search
        end
      end
    end
  end  
end


