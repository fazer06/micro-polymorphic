Rails.application.routes.draw do

# These routes set up both people and businesses for editing, and also adds 
# a nested resource for interactions. This allows us to easily create 
# interactions for both people and businesses.

  resources :people do 
    resources :interactions, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :businesses do
    resources :interactions, only: [:new, :create, :edit, :update, :destroy]
  end

  root to: "people#index"

end
