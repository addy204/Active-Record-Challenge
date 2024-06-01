# Author Aditya Sharma
# Course WEBD-3011 (255576) Agile Full Stack Web Development
# Version 1.0
# Discription Finds and inspects products recived, uses active record
# to print total num of prod, prints name of prod above 10 and starting with c,
# prints total num of prod with a low quantity
# finds a name of a cat through prod, builds a persists a new prod to cat
# and finds a specific cnd prints all prod at a specifc price
require_relative 'ar.rb'
require_relative 'models/product.rb'
require_relative 'models/category.rb'

#shows the total number of products
number_of_products = Product.count
puts "There are #{number_of_products} in the products table."

# finds the first product in the products table
product = Product.first
puts "Product Details: #{product.inspect}"

# prints all the colums in the products table
puts "The names of all columns in the products table: #{Product.column_names.join(', ')}"

# NAmes of products that are above $10 and start with C
product_over_10 = Product.where('price > ? AND name Like ?', 10, 'C%')
puts "Products over the $10 dollar mark with names starting with 'C: "
product_over_10.each do |prod|
  puts prod.name
end

# prints the products with a low products which is less than 5
low_stock_products = Product.where('stock_quantity < ?', 5).count
puts "The total number of prodcuts in low stock: #{low_stock_products}"

# Find the name of the category associated with the chai product
product_chai = Product.find_by(name: 'Chai')
if product_chai
  category_name = product_chai.category.name
  puts "Category associated with product 'Chai': #{category_name}"
else
  puts "Product 'Chai' not found."
end

# Find a specific category and use it to build and persist a new product associated with this category
category = Category.find_by(name: 'Beverages')
if category
  new_product = category.products.build(
    name: 'Mocha',
    description: 'Mocha product associated with Beverages category',
    price: 5.99,
    stock_quantity: 10
  )

  if new_product.save
    puts "New product '#{new_product.name}' associated with category '#{category.name}' saved successfully."
  else
    puts "Failed to save new product: #{new_product.errors.full_messages.join(', ')}"
  end
else
  puts "Category 'Beverages' not found."
end

# Find a category and use it to find all the associated products over a $15 price
category_beverages = Category.find_by(name: 'Beverages')
if category_beverages
  products_over_price = category_beverages.products.where('price > ?', 15)
  if products_over_price.any?
    puts "Products associated with category 'Beverages' over $15:"
    products_over_price.each do |product|
      puts "#{product.name}: $#{product.price}"
    end
  else
    puts "No products associated with category 'Beverages' are over $10."
  end
else
  puts "Category 'Beverages' not found."
end
