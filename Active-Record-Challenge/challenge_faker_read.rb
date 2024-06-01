# Author Aditya Sharma
# Course WEBD-3011 (255576) Agile Full Stack Web Development
# Version 1.0
# Discription finds and displays all cat names and accociated products
require_relative 'ar.rb'
require_relative 'models/category.rb'
require_relative 'models/product.rb'

# Find all the categories in the database
categories = Category.all

# Display all category names and their associated products (name and price) in a nicely formatted list
categories.each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  - Product: #{product.name}, Price: $#{product.price}"
  end
end
