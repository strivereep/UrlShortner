Rails.application.routes.draw do
  root 'urls#index'

  resources 'urls'

  get '/:short_url', to: 'urls#original_url'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
