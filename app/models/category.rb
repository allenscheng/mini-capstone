class Category < ApplicationRecord
  has_many :category_products 

  has_many :products, through: :category_products
  #above is the short for below
  # def products
  #   catergory_products.map {|category_product| category_product.product}
  # end
end
