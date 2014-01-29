Portfolio::Application.routes.draw do
  resources :posts

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root :to => 'posts#index'
  resources :posts

end
