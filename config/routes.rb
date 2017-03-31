Rails.application.routes.draw do
  resources :user_envelopes
  resources :account_transactions
  resources :categories
  resources :envelopes
  resources :accounts
  resources :plaid_access_tokens
  resources :goals
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #plaid routes
  post '/set_access_token' => 'accounts#set_access_token'
  post '/get_access_token' => 'accounts#get_access_token'
  get '/plaid_accounts' => 'accounts#plaid_accounts'
  get '/plaid_item' => 'accounts#plaid_item'
  get '/plaid_transactions' => 'accounts#plaid_transactions'
  get '/create_public_token' => 'accounts#create_public_token'
end
