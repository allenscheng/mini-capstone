Rails.application.routes.draw do
  namespace :v1 do 
    get "/clothes" => "products#index"
    post "/clothes" => "products#create"
    get "/clothes/:id" => "products#show"
    patch "/clothes/:id" => "products#update"
    delete "/clothes/:id" => "products#destroy"
  end 
end
