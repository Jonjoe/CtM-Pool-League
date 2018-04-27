Rails.application.routes.draw do

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
    controller: "clearance/passwords",
    only: [:create, :edit, :update]
  end
  
  resources :users
  
  get "/invite" => "users#invite", as: "invite_user"        
  post "/invite/precreate" => "users#invite_pre_create", as: "invite_user_precreate"        
  get "/invited/:code" => "users#manage_invited", as: "manage_invited_user"        
  post "/invite/create" => "users#invite_create", as: "invite_user_create"        

  resources :leagues do
    get "/archive" => "leagues#archive", as: "archive"    
    get "/close" => "leagues#close", as: "close"    
    resources :games do
      get "/player1_won" => "games#player1_won", as: "player1_won"    
      get "/player2_won" => "games#player2_won", as: "player2_won"    
    end 
  end

  root 'home#index'
end
