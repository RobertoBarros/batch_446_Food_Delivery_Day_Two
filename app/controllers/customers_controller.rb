require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    name = @view.ask_name
    address = @view.ask_address

    new_customer = Customer.new(name: name, address: address)

    @customer_repository.create(new_customer)
  end

  def list
    all_customers = @customer_repository.all

    @view.display(all_customers)
  end
end
