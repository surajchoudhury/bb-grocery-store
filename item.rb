class Item
  attr_reader :name, :quantity, :unit_price

  def initialize(name, quantity)
    @name = name
    @quantity = quantity
    @unit_price =  Stock::AVAILABLE_ITEMS[@name] 
  end

  def price 
    sales =  Stock::ITEMS_ON_SALE[@name]
    sales.nil? ? @unit_price * @quantity : sales_price(sales)
  end

  def sales_price(sales)
    (@quantity / sales[:quantity] * sales[:price]) +
    (@quantity % sales[:quantity] * @unit_price)
  end
end