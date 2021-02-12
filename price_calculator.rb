module PriceCalculator 
  def total_amount(items) 
    items.sum{ |i| i[:item].unit_price * i[:quantity] }
  end

  def saved_amount(items) 
    total_amount(items) - items.sum{ |i| i[:item].price(i[:quantity]) }
  end
end