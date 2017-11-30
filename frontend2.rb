require "unirest"
require "pp"

class Frontend
  def initialize
    @base_url = "http://localhost:3000"
  end
  def show_menu
    system "clear"
    puts "Welcome to the clothes app."
    puts "Please enter in an option."
    puts "1 - to print all the clothes"
    puts "  1.1 - to search name"
    puts "  1.2 - to sort price in ascending order"
    puts "2 - to create a new store clothes"
    puts "3 - to display an individual item"
    puts "4 - to update an item"
    puts "5 - to remove an item"
    puts "6 - view your orders"
    puts  
    puts "[signup] - Signup (create a user)"
    puts  
    puts "[login] - Login (create a JSON web token)"
    puts "[logout] - Logout (erase the JSON web token)"
    puts ""
    puts "[q] Quit"
  end
  def show_all_products
    response = Unirest.get("#{@base_url}/v1/clothes")
    clothes = response.body
    pp clothes
  end
  def show_all_products_search
    print "Please enter search terms: "
    input_name = gets.chomp 
    response = Unirest.get("#{@base_url}/v1/clothes", parameters: {name_search: input_name})
    clothes = response.body
    pp clothes
  end
  def show_all_products_sorted_by_price
    response = Unirest.get("#{@base_url}/v1/clothes", parameters: {price_sort: true})
    clothes = response.body
    pp clothes 
  end
  def create_product
    params = {}
    print "Enter clothe type: "
    params["name"] = gets.chomp
    print "Enter in length: "
    params["length"] = gets.chomp
    print "Enter a color: "
    params["color"] = gets.chomp
    print "Enter in a price: "
    params["price"] = gets.chomp
    print "Enter in an image: "
    params["image"] = gets.chomp
    print "Enter in a description: "
    params["description"] = gets.chomp
    # print "Enter in active status(true or false): "
    # params["active"] = gets.chomp
    response = Unirest.post("#{@base_url}/v1/clothes", parameters: params)
    clothes = response.body
    pp clothes
  end
  def show_one_product
    print "Enter clothes id to view: "
    clothes_id = gets.chomp
    response = Unirest.get("#{@base_url}/v1/clothes/#{clothes_id}")
    clothes = response.body
    pp clothes
    print "Would you line to order this? (y/n):"
    order_response = gets.chomp  
    if order_response == "y"
      params = {}
      print "Enter the quantity: "
      params["quantity"] = gets.chomp.to_i
      params["product_id"] = clothes_id 
      response = Unirest.post("#{@base_url}/v1/orders", parameters: params)
      pp response.body
    end
  end
  def update_product
    print "Enter the id to update: "
    clothes_id = gets.chomp
    response = Unirest.get("#{@base_url}/v1/clothes/#{clothes_id}")
    clothes = response.body
    params = {}
    print "Enter updated clothe type(#{clothes["name"]}): "
    params["name"] = gets.chomp
    print "Enter updated length(#{clothes["length"]}): "
    params["length"] = gets.chomp
    print "Enter updated color(#{clothes["color"]}): "
    params["color"] = gets.chomp
    print "Enter updated price(#{clothes["price"]}): "
    params["price"] = gets.chomp
    print "Enter updated image(#{clothes["image"]}): "
    params["image"] = gets.chomp
    print "Enter updated description(#{clothes["description"]}): "
    params["description"] = gets.chomp
    print "Enter updated active(#{clothes["active"]}): "
    params["active"] = gets.chomp
    params.delete_if { |_key, value| value.empty? }
    response = Unirest.patch("#{@base_url}/v1/clothes/#{clothes_id}", parameters: params)
    clothes = response.body
    pp clothes
  end
  def delete_product
    print "Enter a clothe id to remove: "
    clothes_id = gets.chomp 
    response = Unirest.delete("#{@base_url}/v1/clothes/#{clothes_id}")
    pp response.body
  end
  def show_all_orders
    response = Unirest.get("#{@base_url}/v1/orders")
    pp response.body 
  end
  def signup
    params = {}
    print "Name: "
    params[:name] = gets.chomp  
    print "Email: "
    params[:email] = gets.chomp  
    print "Password: " 
    params[:password] = gets.chomp
    print "Password confirmation: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("#{@base_url}/v1/users", parameters: params)
    pp response.body 
  end
  def login
    puts "Login to the app" 
    params = {}
    print "Email: "
    params[:email] = gets.chomp
    print "Password: " 
    params[:password] = gets.chomp
    response = Unirest.post("#{@base_url}/user_token", parameters: {auth: params})
    pp response.body
    # Save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    pp response.body
  end
  def logout
    jwt = ""
    Unirest.clear_default_headers()
    puts "Logged out successfully."
  end
  def quit
    puts "Bye!!!!"
    exit
  end
  def run
    while true 
      show_menu
      user_choice = gets.chomp 
      if user_choice == "1"
        show_all_products
      elsif user_choice == "1.1"
        show_all_products_search
      elsif user_choice == "1.2"
        show_all_products_sorted_by_price
      elsif user_choice == "2"
        create_product
      elsif user_choice == "3"
        show_one_product
      elsif user_choice == "4"
        update_product
      elsif user_choice == "5"
        delete_product
      elsif user_choice == "6"
        show_all_orders
      elsif user_choice == "signup"
        signup
      elsif user_choice == "login" 
        login
      elsif user_choice == "logout"
        logout
      elsif user_choice == "q"
        quit
      end
      puts  
      puts "Press enter to continue."
      gets.chomp  
    end 
  end
end



frontend = Frontend.new  
frontend.run 