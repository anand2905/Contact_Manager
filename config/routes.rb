Rails.application.routes.draw do
	get "contacts/index", as: 'contacts'
	get 'contacts/new', as: 'new_contacts'
	post '/contacts/create' 
	root 'contacts#index'
end
