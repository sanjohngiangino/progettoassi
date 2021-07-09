Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' , registrations: "users/registrations"}
  root "songs#index"
  resources :playlists
  resources :songs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #Admin Actions
get '/adm', to: 'admins#index', :as => :admin_view
get '/adm/ban/:id', to: 'admins#ban_user', :via => :get, :as => :admin_ban_user
get '/adm/unban/:id', to: 'admins#unban_user', :via => :get, :as => :admin_unban_user
get '/adm/admin/:id', to: 'admins#admin_user', :via => :get, :as => :admin_admin_user
get '/adm/unadmin/:id', to: 'admins#unadmin_user', :via => :get, :as => :admin_unadmin_user

get '/adm/editor/:id', to: 'admins#editor_user', :via => :get, :as => :admin_editor_user
get '/adm/uneditor/:id', to: 'admins#uneditor_user', :via => :get, :as => :admin_uneditor_user

end
