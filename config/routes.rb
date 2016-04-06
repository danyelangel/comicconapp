Rails.application.routes.draw do
  devise_for :admins, :skip => [:sessions, :passwords]
  as :admin do
    get "/admin/login" => "admins/sessions#new", :as => :new_admin_session
    post '/admin/login' => 'admins/sessions#create', :as => :admin_session
    match '/admin/logout' => 'admins/sessions#destroy', :as => :destroy_admin_session, :via => Devise.mappings[:admin].sign_out_via

    post "/admin/new_password" => "admins/passwords#create", :as => :admin_password
    get "/admin/new_password" => "admins/passwords#new", :as => :new_admin_password
    get "/admin/edit_password" => "admins/passwords#edit", :as => :edit_admin_password
    patch "/admin/new_password" => "admins/passwords#update"
    put "/admin/new_password" => "admins/passwords#update"
  end

  resources :articles, :path => "admin/blog"

  root 'application#home'

  get '/invitados',     to: 'application#guests'
  get '/prensa',        to: 'application#press'
  get '/prensa/:slug',  to: 'articles#public_show'
  get '/admin',         to: 'application#admin'

  post '/contact_us',   to: 'application#contact_us'
end
