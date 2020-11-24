Rails.application.routes.draw do
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
