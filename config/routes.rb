Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students do
    resources :addresses
  end
  resources :addresses
  resources :courses
end
