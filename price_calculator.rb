module PriceCalculator 
  def total_amount(items) 
    items.sum{ |i| i.unit_price * i.quantity }
  end

  def saved_amount(items) 
    total_amount - items.sum{ |i| i.price }
  end
end