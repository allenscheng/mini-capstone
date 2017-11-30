supplier = Supplier.new({name: "nike", email: "nike@email.com", phone_number: "213-234-2342"})
supplier.save 
supplier = Supplier.new({name: "adidas", email: "adidas@email.com", phone_number:"342-234-9879"})
supplier.save

product = Product.new({name: "shirt", length: "short", color: "red", price: 10.00, supplier_id: 1 })
product.save
image = Image.new(url: "http://images.footballfanatics.com/FFImage/thumb.aspx?i=/productImages/_2712000/ff_2712965c_full.jpg&w=340", product_id: 1)
image.save 
product = Product.new({name: "shirt", length: "long", color: "red", price: 11.00, supplier_id: 1})
product.save
image = Image.new(url: "http://nba.frgimages.com/FFImage/thumb.aspx?i=/productImages/_2712000/ff_2712935a_full.jpg&w=340", product_id: 2)
image.save 
product = Product.new({name: "pant", length: "short", color: "black", price: 7.00, supplier_id: 1})
product.save
image = Image.new(url: "https://assets.academy.com/mgen/79/10568779.jpg?is=500,500", product_id: 3)
image.save 
product = Product.new({name: "pant", length: "long", color: "black", price: 10.00, supplier_id: 1})
product.save
image = Image.new(url: "https://images-na.ssl-images-amazon.com/images/I/61cJR8nl8qL._UL1500_.jpg", product_id: 4)
image.save 







# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
