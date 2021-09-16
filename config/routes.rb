Rails.application.routes.draw do

  get 'past_lectures/create'
  get 'past_lectures/destroy'
  get 'current_lectures/create'
  get 'current_lectures/destroy'
  get 'evaluations/show/:lecture_id' => 'evaluations#show',as: 'evaluations_show'
  get 'evaluations/new/:lecture_id' => 'evaluations#new', as: 'evaluations_new'
  post 'evaluations/new/:lecture_id' => 'evaluations#create' 

  get 'comments/create'
  get 'comments/destroy'
  
  # get 'lectures/index' => 'lectures#index'
  # get 'lectures/show' => 'lectures#show'
  
  get 'top/about'
  get 'top/index'
  
  get 'questions/new' => 'questions#new'
  post 'questions/create' => 'questions#create'
  get 'questions/:id' => 'questions#show', as: 'question'
  patch 'questions/:id' => 'questions#update'
  delete 'questions/:id' => 'questions#destroy'
  get 'questions/:id/edit' => 'questions#edit', as:'edit_question'
  

  devise_scope :user do
    # TIPS: ユーザー登録失敗のリダイレクトのエラーを防ぐ https://github.com/heartcombo/devise/blob/master/app/controllers/devise/registrations_controller.rb
    get '/users', to: 'devise/registrations#new'
  end

  devise_for :users
  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :questions do
    resources :answers, only: [:create, :destroy]
  end

  resources :lectures do
    resources :comments, only: [:create, :destroy]

    # current_lectureの登録機能
    resource :current_lectures, only: [:create, :destroy]
    resource :past_lectures, only: [:create, :destroy]
  end

  resources :evaluations

  root 'top#about'

end