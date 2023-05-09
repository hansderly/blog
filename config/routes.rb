Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  ressouces :users only: [:index, :show] do
    ressouces :posts only: [:index, :show]
  end

  root "users#index"
end
