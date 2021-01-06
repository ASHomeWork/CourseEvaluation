Rails.application.routes.draw do
  get 'sessions/new'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  'new_gender',to: 'genders#new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  get '/logout',    to: 'sessions#destroy'
  get '/search',   to: 'courses#index'
  post '/courses/select_with_ajax', to: 'courses#select_with_ajax'
  post '/courses/select_with_ajax1', to: 'courses#select_with_ajax1'
  post '/courses/select_with_logged', to: 'courses#select_with_logged'
  get '/select_with_logged', to: 'courses#select_with_logged'

  resources :courses do
    collection do
      match 'search' => 'courses#search', via: [:get, :post], as: :search
    end
  end
  resources :grades
  resources :reviews
  resources :marks
  resources :teachers
  resources :colleges
  resources :majors
  resources :courses
  resources :genders
  resources :comments
  resources :messages
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
