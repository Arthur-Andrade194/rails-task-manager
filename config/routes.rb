Rails.application.routes.draw do
  # read all
  get 'tasks', to: 'tasks#index'

  # create
  get 'tasks/new', to: 'tasks#new', as: :new_task

  post 'tasks', to: 'tasks#create'

  # read one with id
  get 'tasks/:id', to: 'tasks#show', as: :task

  # edit

  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit

  patch 'tasks/:id', to: 'tasks#update'

  # destroy
  delete '/tasks/:id', to: 'tasks#destroy'
end
