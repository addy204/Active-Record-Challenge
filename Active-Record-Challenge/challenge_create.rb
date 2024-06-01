# Author Aditya Sharma
# Course WEBD-3011 (255576) Agile Full Stack Web Development
# Version 1.0
# Discription created three new prod using different ways
# all products are presistence to the database
# created a prod with missing reqire colums to display
# saves products and prints any errors
require_relative 'ar.rb'
require_relative 'models/product.rb'

# function to print the result of saving a product
def print_save_result(product)
  if product.save
    puts "Product '#{product.name}' was saved."
  else
    puts "Failed to save product '#{product.name || 'Unnamed'}': #{product.errors.full_messages.join(", ")}"
  end
end

# 1. Creating three new products using different ways to create AR objects

# Way 1: Using `new` and `save`
product_1 = Product.new(name: 'Ice Cream', description: 'Frozen Treat', price: 6.99, stock_quantity: 10, category_id: 1)
print_save_result(product_1)

# Way 2: Using `create` (this automatically calls `save`)
product_2 = Product.create(name: 'Cookie', description: 'Baked Treat', price: 3.99, stock_quantity: 15, category_id: 1)

if product_2.persisted?
  puts "Product '#{product_2.name}' was saved."
else
  puts "Failed to save product '#{product_2.name}': #{product_2.errors.full_messages.join(", ")}"
end

# Way 3: Using `create!` (this raises an exception if `save` fails)
begin
  product_3 = Product.create!(name: 'Red Bull', description: 'Energy Drink', price: 2.99, stock_quantity: 25, category_id: 1)
  puts "Product '#{product_3.name}' was saved."
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to save product: #{e.message}"
end

# 2. Create a Product object that is missing some required columns
invalid_product = Product.new(description: 'Required fields are missing')

# Attempt to save this product and print all the AR errors
if invalid_product.save
  puts "Invalid product was saved, which is unexpected."
else
  puts "Failed to save invalid product: #{invalid_product.errors.full_messages.join(", ")}"
end
