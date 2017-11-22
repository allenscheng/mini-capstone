class Product < ApplicationRecord
  validates :clothe_type, presence: true
  validates :length, presence: true
  validates :color, presence: true
  validates :description, length: {maximum: 100}
  validates :price, numericality: {greater_than: 0}

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
      clothe_type: clothe_type,
      length: length,
      color: color,
      discount: is_discounted,
      price: price, 
      tax: tax,
      total: total,
      description: description,
      active: active, 
      image: image
    }
  end
end
