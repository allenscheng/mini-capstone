require "unirest"
require "pp"

system "clear"

puts "Please enter in an option"
puts "1 - to print all the clothes"
puts "2 - to create a new store clothes"
puts "3 - to display an individual item"
puts "4 - to update an item"
puts "5 - to remove an item"
user_choice = gets.chomp 

if user_choice == "1"
  response = Unirest.get("http://localhost:3000/v1/clothes")
  clothes = response.body
  pp clothes 
elsif user_choice == "2"
  params = {}
  print "Enter a shirt length: "
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
  response = Unirest.post("http://localhost:3000/v1/clothes", parameters: params)
  clothes = response.body
  pp clothes
elsif user_choice == "3"
  print "Enter clothes id to view: "
  clothes_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/clothes/#{clothes_id}")
  clothes = response.body
  pp clothes
elsif user_choice == "4"
  print "Enter the id to update: "
  clothes_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/clothes/#{clothes_id}")
  clothes = response.body
  params = {}
  print "Enter updated shirt length(#{clothes["length"]}): "
  params["length"] = gets.chomp
  print "Enter updated color(#{clothes["color"]}): "
  params["color"] = gets.chomp
  print "Enter updated price(#{clothes["price"]}): "
  params["price"] = gets.chomp
  print "Enter updated image(#{clothes["image"]}): "
  params["image"] = gets.chomp
  print "Enter updated description(#{clothes["description"]}): "
  params["description"] = gets.chomp
  print "Enter updated active#{clothes["active"]}): "
  params["active"] = gets.chomp
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/v1/clothes/#{clothes_id}", parameters: params)
  clothes = response.body
  pp clothes
elsif user_choice == "5"
  print "Enter a clothe id to remove: "
  clothes_id = gets.chomp 
  response = Unirest.delete("http://localhost:3000/v1/clothes/#{clothes_id}")
  pp response.body
end