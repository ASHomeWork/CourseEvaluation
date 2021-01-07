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

  get '/courses/review', to: 'courses#to_review'

  resources :courses do
    collection do
      match 'search' => 'courses#search', via: [:get, :post], as: :search
    end

  end

  resources :users
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to:'users#destroy'

  resources :new_user
  get 'users/new', to: 'users#new'

  resources :edit_user
  get '/users/:id/edit', to: 'users#edit'

  resources :teachers
  get '/teachers', to: 'teachers#index'
  post '/teachers', to: 'teachers#create'
  patch '/teachers/:id', to: 'teachers#update'
  put '/teachers/:id', to: 'teachers#update'
  delete '/teachers/:id', to:'teachers#destroy'

  resources :new_teacher
  get 'teachers/new', to: 'teachers#new'

  resources :edit_teacher
  get '/teachers/:id/edit', to: 'teachers#edit'

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
