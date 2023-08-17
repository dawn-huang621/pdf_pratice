Rails.application.routes.draw do

  resources :resumes, except: [:create] do
    member do
      get 'generate_pdf', as: :generate_pdf
    end
  end
  post '/resumes/1/second', to: 'resumes#second', as: :second_page
end
