class Product < ApplicationRecord
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
      length: length,
      color: color,
      discount: is_discounted,
      tax: tax,
      total: total,
      description: description,
      active: active
    }
  end
end
