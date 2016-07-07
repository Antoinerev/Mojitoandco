Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'

  resources :cocktails do
    resources :doses, only: [:new, :create]
    # resources :
  end


end

#            Prefix Verb   URI Pattern                                 Controller#Action
#              root GET    /                                           cocktails#index
#    cocktail_doses POST   /cocktails/:cocktail_id/doses(.:format)     doses#create
# new_cocktail_dose GET    /cocktails/:cocktail_id/doses/new(.:format) doses#new
#         cocktails GET    /cocktails(.:format)                        cocktails#index
#                   POST   /cocktails(.:format)                        cocktails#create
#      new_cocktail GET    /cocktails/new(.:format)                    cocktails#new
#     edit_cocktail GET    /cocktails/:id/edit(.:format)               cocktails#edit
#          cocktail GET    /cocktails/:id(.:format)                    cocktails#show
#                   PATCH  /cocktails/:id(.:format)                    cocktails#update
#                   PUT    /cocktails/:id(.:format)                    cocktails#update
#                   DELETE /cocktails/:id(.:format)                    cocktails#destroy
