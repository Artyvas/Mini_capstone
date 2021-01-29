Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "/products/:id" => "products#show"
    get "/products" => "products#index"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
    post "/orders" => "orders#create"
    get "/orders/:id" => "orders#show"
    get "/orders" => "orders#index"
    post "/carted_products" => "carted_products#create"
    get "/carted_products" => "carted_products#index"
  end
end
