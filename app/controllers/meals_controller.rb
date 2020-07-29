require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    name = @view.ask_name
    price = @view.ask_price

    new_meal = Meal.new(name: name, price: price)

    @meal_repository.create(new_meal)
  end

  def list
    all_meals = @meal_repository.all

    @view.display(all_meals)
  end
end
