Features::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  match 'login', :to => 'devise/sessions#new', :as => 'new_user_session'
  match 'logout', :to  => 'devise/sessions#destroy', :as => 'destroy_user_session'
  match 'signup', :to => 'devise/registrations#new', :as => 'new_user_registration'

  resources :features do
    get :by_tag, :on => :collection
    get :unapproved, :on => :collection
    put :approve, :on => :member
    put :unapprove, :on => :member
  end
  resources :tags
  root :to => 'features#index'
end
