class OrdersView
  def ask_meal_index
    puts ">>>> Enter the meal number:"
    gets.chomp.to_i - 1
  end

  def ask_customer_index
    puts ">>>> Enter the customer number:"
    gets.chomp.to_i - 1
  end

  def ask_delivery_guy_index
    puts ">>>> Enter the delivery guy number:"
    gets.chomp.to_i - 1
  end

  def ask_order_index
    puts ">>>> Enter the order number:"
    gets.chomp.to_i - 1
  end

  def display_delivery_guys(delivery_guys)
    delivery_guys.each_with_index do |delivery_guy, index|
      puts "#{index + 1} - #{delivery_guy.username}"
    end
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - Meal: #{order.meal.name} | Customer: #{order.customer.name} | Address: #{order.customer.address} | Delivery Guy: #{order.employee.username}"
    end
  end


end