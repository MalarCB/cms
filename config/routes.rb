Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'home#index'

  get 'services', to: 'home#services', as: :services
  get 'gallery', to: 'home#gallery', as: :gallery
  get 'about', to: 'home#about', as: :about


  get 'contact', to: 'contact#index', as: :contact
  match 'contact', to: 'contact#save', as: :save_contact, via: [:post, :put, :patch]

end
