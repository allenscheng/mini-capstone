# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new({length: "short", color: "red", price: "10.00", image: "http://images.footballfanatics.com/FFImage/thumb.aspx?i=/productImages/_2712000/ff_2712965c_full.jpg&w=340"})
product.save
#product = Product.new({clothe_type: "shirt", length: "short", color: "red", price: "10.00", image: "http://images.footballfanatics.com/FFImage/thumb.aspx?i=/productImages/_2712000/ff_2712965c_full.jpg&w=340"})
#product.save
product = Product.new({length: "long", color: "red", price: "11.00", image: "http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages/_2712000/ff_2712935a_full.jpg&w=340"})
product.save
#product = Product.new({clothe_type: "shirt", length: "long", color: "red", price: "11.00", image: "http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages/_2712000/ff_2712935a_full.jpg&w=340"})
#product.save
product = Product.new({length: "short", color: "black", price: "7.00", image: "https://assets.academy.com/mgen/79/10568779.jpg?is=500,500"})
product.save
#product = Product.new({clothe_type: "pant", length: "short", color: "black", price: "7.00", image: "https://assets.academy.com/mgen/79/10568779.jpg?is=500,500"})
#product.save
product = Product.new({length: "long", color: "black", price: "10.00", image: "https://images-na.ssl-images-amazon.com/images/I/61cJR8nl8qL._UL1500_.jpg"})
product.save
#product = Product.new({clothe_type: "pant", length: "long", color: "black", price: "10.00", image: "https://images-na.ssl-images-amazon.com/images/I/61cJR8nl8qL._UL1500_.jpg"})
#product.save