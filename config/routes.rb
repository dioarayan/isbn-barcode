Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "isbn#index"
  post "isbn-result", to: "isbn#calculate_isbn", as: "calculate_isbn"

end
