Rails.application.routes.draw do
  # list cocktails
  get 'cocktails', to: 'cocktails#index'
  # create new cocktail
  get 'cocktails/new', to: 'cocktails#new', as: :new_cocktail
  # view details of cocktail + dose needed for each ingredient
  get 'cocktails/:id', to: 'cocktails#show', as: :cocktail
  post 'cocktails', to: 'cocktails#create'

  get 'cocktails/:cocktail_id/doses/new', to: 'doses#new', as: :new_dose
  post 'cocktails/:cocktail_id/doses', to: 'doses#create', as: :cocktail_doses
  delete 'doses/:id', to: 'doses#destroy'
end
