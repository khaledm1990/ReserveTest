Rails.application.routes.draw do

  get 'list_items/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#index'

  resources :lists, except: [:show] do 
    member do 
      put :soft_destroy 
      put :restore
    end 
    collection do
      get :thrash
    end 
    resources :list_items
  end 
  resources :list_items do
    resources :taggings do 
      collection do 
        put ":tag_id/soft_destroy"   =>   "taggings#soft_destroy", as: "soft_destroy"
        put ":tag_id/restore"        =>   "taggings#restore", as: "restore"
      end 
    end 
  end 

  namespace :api do
    namespace :v1 do
      get ':owner_name/articles'          =>  "owners/articles#articles_by_owner_name"
      resources :articles, only: [:show]
      resources :owners, only: [:index]
      get ':owner_name'                    => "owners#show"
    end 
  end 
end
