Rails.application.routes.draw do
  get "/short_shirt_url" => "products#short_shirt_method"
  get "/long_shirt_url" => "products#long_shirt_method"
  get "/short_pant_url" => "products#short_pant_method"
  get "/long_pant_url" => "products#long_pant_method"
end
