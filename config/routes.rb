Rails.application.routes.draw do
  root to: "posts#index"


  resources :posts do
    resources :comments, module: :posts, only: [:create]
    member do
      patch :like, :unlike
    end
  end


end
