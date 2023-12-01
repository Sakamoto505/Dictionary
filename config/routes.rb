Rails.application.routes.draw do

  root 'words#search'


  resources :words do
    collection do
      get 'search'
    end
  end
end
