Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :users
	get "contacts/index", as: 'contacts'
	get 'contacts/new', as: 'new_contacts'
	post 'contacts/create', as: 'create_contact'
  get 'contacts/:id/edit', to: 'contacts#edit', as: 'edit_contact'
	patch 'contacts/:id/update', to: 'contacts#update', as: 'update_contact'
  delete 'contacts/:id/destroy', to: 'contacts#destroy', as: 'destroy_contact'


  get '/contacts/autocomplete', to: 'contacts#autocomplete'

  get '/dashboard', to: 'dashboard#index'
  post '/groups', to: 'groups#create'
  root 'home#index'
end
