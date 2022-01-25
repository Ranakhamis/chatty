Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :applications, param: :access_token, only: [:index, :show, :create, :update] do
  end  
end
