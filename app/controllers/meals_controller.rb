require_relative '../views/meal_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealView.new
  end

  def add
    # 1. Perguntar ao user o nome do prato
    name = @view.ask_for_name    
    # 2. Perguntar ao user o preço do prato
    price = @view.ask_for_price
    # 3. Criar um novo objeto Meal
    new_meal = Meal.new(name: name, price: price)
    # 4. Adicionar a meal ao repositório
    @meal_repository.add(new_meal)
  end

  def list
    # 1. Pegar todas as meals disponiveis no repositório
    # 2. Chamo a view para mostrar a lista de Meals
    @view.display(@meal_repository.all)
  end
end