# Author Aditya Sharma
# Course WEBD-3011 (255576) Agile Full Stack Web Development
# Version 1.0
# Discription finds all products with low quntity below 40 and add 1 to the database
require_relative 'ar.rb'
require_relative 'models/product.rb'

# Find all products which have a stock quantity greater than 40
products = Product.where('stock_quantity > 40')

# increases the stock quantity of each product by 1
products.each do |product|
  product.stock_quantity += 1
  product.save
end

puts "Updated stock quantities for all products with stock quantity higher than 40."
