Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :trails do
    resources :comments
  end
end
