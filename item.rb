class Item
  attr_reader :name, :unit_price

  def initialize(name)
    @name = name
    @unit_price =  Stock::RATE_CHART[@name] 
  end

  def price(quantity)
    sales =  Stock::ITEMS_ON_SALE[@name]
    sales.nil? ? @unit_price * quantity : sales_price(quantity, sales)
  end

  def sales_price(quantity, sales)
    (quantity / sales[:quantity] * sales[:price]) +
    (quantity % sales[:quantity] * @unit_price)
  end
end