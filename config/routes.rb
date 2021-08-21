Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'timeline' => 'relationships#timeline'
  end
  get 'unsubscribe' => 'users#unsubscribe'
  resources :statuses, only: [:new, :index, :show, :edit, :update] do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
