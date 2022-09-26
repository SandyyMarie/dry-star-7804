Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show] do
      # resources :doctors_patients, only: [:destroy]
      delete ':id/doctors_patients/:id', to: 'doctors_patients#destory'
  end

  # resources :doctors_patients, only: [:destroy] do

  # end


end
