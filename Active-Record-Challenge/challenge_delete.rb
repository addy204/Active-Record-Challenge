# Author Aditya Sharma
# Course WEBD-3011 (255576) Agile Full Stack Web Development
# Version 1.0
# Discription deletes a created prod from the database
require_relative 'ar.rb'
require_relative 'models/product.rb'

# Finds one of the products that was created in challenge_create.rb
product_delete = Product.find_by(name: 'Ice Cream')

# Check to see if the product exists
if product_delete
  # if the product exist it will deletes the product from the database
  product_delete.destroy
  puts "Product '#{product_delete.name}' has been deleted from the database."
else
  puts "Product was not found in the database."
end
