class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    @employee = @sessions_controller.sign_in

    loop do
      if @employee.delivery_guy?
        print_actions_delivery_guy
        action = gets.chomp.to_i
        dispatch_delivery_guy(action)
      else
        print_actions_manager
        action = gets.chomp.to_i
        dispatch_manager(action)
      end
    end
  end

  private

  def print_actions_manager
    puts '-' * 100
    puts '---- MANAGER OPTION ---'
    puts '-' * 100
    puts "1. Create new Meal"
    puts "2. List all Meals"
    puts '-' * 100
    puts "3. Create new Customer"
    puts "4. List all Customers"
    puts '-' * 100
    puts "5. Create Order"
    puts "6. List Undelivered Orders"
    puts '-' * 100
    puts "Enter your action:"
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    end
  end

  def print_actions_delivery_guy
    puts '-' * 100
    puts '---- DELIVERY GUY OPTION ---'
    puts "1. List My Undelivered Orders"
    puts "2. Mark order as Delivered"
    puts '-' * 100
    puts "Enter your action:"
  end

  def dispatch_delivery_guy(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    end
  end
end
