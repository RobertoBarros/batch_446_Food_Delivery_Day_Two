require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end

  def add
    meals = @meal_repository.all
    @meals_view.display(meals)
    meal_index = @view.ask_meal_index
    meal = meals[meal_index]

    customers = @customer_repository.all
    @customers_view.display(customers)
    customer_index = @view.ask_customer_index
    customer = customers[customer_index]

    delivery_guys = @employee_repository.all_delivery_guys
    @view.display_delivery_guys(delivery_guys)
    delivery_guy_index = @view.ask_delivery_guy_index
    employee = delivery_guys[delivery_guy_index]

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.display(undelivered_orders)
  end

  def list_my_orders(employee)
    my_orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @view.display(my_orders)
  end

  def mark_as_delivered(employee)
    my_orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @view.display(my_orders)
    order_index = @view.ask_order_index
    order = my_orders[order_index]
    order.deliver!
    @order_repository.save_all
  end

end
