Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :v1 do 
    post "/users" => "users#create"

    post "/orders" => "orders#create"
    get "/orders" => "orders#index"

    get "/clothes" => "products#index"
    post "/clothes" => "products#create"
    get "/clothes/:id" => "products#show"
    patch "/clothes/:id" => "products#update"
    delete "/clothes/:id" => "products#destroy"

    get "/supplier" => "products#index"
    post "/supplier" => "products#create"
    get "/supplier/:id" => "products#show"
    patch "/supplier/:id" => "products#update"
    delete "/supplier/:id" => "products#destroy"

    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"
    delete "/carted_products/:id" => "carted_products#destory"
  end  
end
