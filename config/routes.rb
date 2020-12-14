Rails.application.routes.draw do


  authenticate :user, lambda { |u| u.admin  } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  if Rails.env.production?
    get '404', :to => 'home#index'
 end

  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'home#index'
  resources :stories
  # root 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
