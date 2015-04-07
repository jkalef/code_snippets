Rails.application.routes.draw do
  
  devise_for :users, :controllers => {registrations: "registrations"}

  #--ROOT-------------------------------
  #will display all of the notes on this page
  #by their category.  Potentially the ability to
  #create a new note on this same page as well
  root "notes#index"


  #--ROUTES-----------------------------
  resources :notes do
    #only want to include specific actions for the comments
    resources :comments, only: [:create, :show, :destroy]
  end

  #--CUSTOM ROUTES-------------------------
  get "/list/:topic" => "notes#list", as: :list

end
