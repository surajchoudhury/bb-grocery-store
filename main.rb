require_relative "store"

puts "Please enter all the items purchased separated by a comma"
items = gets.chomp.delete(' ').split','

store = Store.new
items.uniq.each {|i| store.add_item(items.count(i),i.downcase)}

# print pricing info
store.print_amount


