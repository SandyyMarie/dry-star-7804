Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show, :destroy] do
  end
  delete '/doctors/:doctor_id/doctors_patients/:patient_id', to: 'doctors_patients#destroy'
    
  resources :patients, only: [:index] do 
  end
end
