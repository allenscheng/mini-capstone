# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(sleeve_length: "short", color: "red", price: "10.00", image: "https://tshirtvila.com/wp-content/uploads/2016/08/44-Merry-Christmas-Celebrate-His-Birth-Christmas-Tshirt-red.jpg")
product.save
product = Product.new(sleeve_length: "long", color: "red", price: "11.00", image: "http://www.brewershirts.com/images/products/20257.jpg")
product.save
product = Product.new(pant_length: "short", color: "black", price: "7.00", image: "https://ddbhkg8lxkxq9.cloudfront.net/media/CACHE/images/products/mako-hybrid-short-black-1-4513/8217531ac4e26f7c948aa0278fbbe1e6.jpg")
product.save
product = Product.new(pant_length: "long", color: "black", price: "10.00", image: "http://hottopic.scene7.com/is/image/HotTopic/10573530_hi?$tile_clp_3up_standard$")
product.save
