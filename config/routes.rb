Rails.application.routes.draw do
  namespace "api" do
    resources :people, only: [:index, :show]
    resources :planets, only: [:index, :show] 
    resources :starships, only: [:index, :show]
  end
end
