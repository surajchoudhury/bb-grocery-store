require_relative "stock"
require_relative "item"
require_relative "price_calculator"

class Store
  include Price_calculator
  attr_reader :items

  def initialize
    @items = []
  end

  def item_on_stock?(name)
    Stock::RATE_CHART.keys.include?(name)
  end
  
  def add_item(quantity, item)
    if item_on_stock?(item) then @items <<  Item.new(item, quantity) 
    else puts "#{item} is not in stock!"
    end
  end

  def print_amount 
    puts @items.size.zero? ? "Purchase some items from store!" 
    : "Total price: #{self.total_amount(@items)} \n You saved #{self.saved_amount(@items).round(2)} today."
    end
end