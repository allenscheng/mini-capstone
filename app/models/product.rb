class Product < ApplicationRecord
  validates :name, presence: true
  validates :length, presence: true
  validates :color, presence: true
  validates :description, length: {maximum: 100}
  validates :price, numericality: {greater_than: 0}
  
  has_many :carted_products
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :orders
  belongs_to :supplier
  # the above, rails writes the below for you 
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end
  has_many :images 
  # the above, rails writes the below for you
  # def images 
  #   image.where(product_id: self.id)
  # end
  def is_discounted
    price.to_i < 10
  end
  def tax
    tax = price.to_i * 0.09
  end
  def total
    total = tax + price.to_i
  end

  def as_json
    {
      id: id,
      name: name,
      length: length,
      color: color,
      discount: is_discounted,
      price: price, 
      tax: tax,
      total: total,
      description: description,
      active: active, 
      images: images.map { |image| image.url},
      supplier: supplier.as_json,
      categories: categories.as_json
    }
  end
end
