Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts do
    member do
      patch :like, :unlike
    end
  end
end
