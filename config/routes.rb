Rails.application.routes.draw do
  # config/routes.rb
  get 'api/fetch_data', to: 'api#fetch_data'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
