Rails.application.routes.draw do

  resources :invitations
  resources :projects do
    post :search, on: :collection
    get :export, on: :member
  end 
  namespace :admin do
    resources :projects, only: :index
  end
  resources :fields
  resources :project_tables
  resources :usertables
  devise_for :users
  mount EpiCas::Engine, at: "/"
  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  #root to: "project_tables#index"
  root to: "projects#index"
  get "/content" => "pages#content"
  get "/create" => "pages#create"
  get "/add_field" => "pages#add_field"
  get "/edit_project" => "pages#edit_project"
  get "/profile" => "usertables#index"
  get "/change_profile" => "usertables#index"
  get "users/sign_in" => "devise/sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
