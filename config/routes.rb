Rails.application.routes.draw do
  get 'cocktails/index'
  # list cocktails
  get 'cocktails', to: 'cocktails#index'
  # # view details of cocktail + dose needed for each ingredient
  # get 'cocktails/:id'
  # # create new cocktail
  # get 'cocktails/new'
  # post 'cocktails'
end
