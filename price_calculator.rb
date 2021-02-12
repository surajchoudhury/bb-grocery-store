module Price_calculator 
  def total_amount 
    self.items.map{ |i| i.unit_price * i.quantity }.inject(:+)
  end

  def saved_amount 
    total_amount - self.items.map{ |i| i.price }.inject(:+)
  end
end