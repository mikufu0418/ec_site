class Order < ApplicationRecord
  def total_price 
    order_details.sum { |order| order.total_price } 
  end 
  def total_number 
    order_details.sum { |order| order.quantity } 
  end 
end
