require_relative '../views/orders_view'
require_relative '../views/meal_view'
require_relative '../views/sessions_view'
require_relative '../views/customer_view'

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    @order_repository = order_repo
    @view = OrdersView.new
    @meal_view = MealView.new
    @customer_view = CustomerView.new
    @session_view = SessionsView.new
  end

  def add
    # 0. Pegar todas as meals e listar p/ o usuário
    # 1. Perguntar qual o index da Meal
    # 2. Salver a Meal escolhida
    meals = @meal_repository.all
    @meal_view.display(meals)
    index = @view.ask_for_index
    meal = meals[index]

    # 0. Pegar todas as customer e listar p/ o usuário
    # 1. Perguntar qual o index da Customer
    # 2. Salver a Customer escolhida
    customers = @customer_repository.all
    @customer_view.display(customers)
    index = @view.ask_for_index
    customer = customers[index]

    # 0. Pegar todas as employee e listar p/ o usuário
    # 1. Perguntar qual o index da employee
    # 2. Salver a employee escolhida
    employees = @employee_repository.all_delivery_guys
    @session_view.display_riders(employees)
    index = @view.ask_for_index
    employee = employees[index - 1]

    order = Order.new(meal: meal, employee: employee, customer: customer)
    @order_repository.add(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @view.display(undelivered_orders)
  end

  def mark_as_delivered(employee)
    list_my_undelivered_orders(employee)
    index = @view.ask_for_index
    my_orders = @order_repository.my_undelivered_orders(employee)
    order = my_orders[index]
    @order_repository.mark_as_delivered(order)
  end

  def list_my_undelivered_orders(employee)
    undelivered_orders = @order_repository.my_undelivered_orders(employee)
    @view.display(undelivered_orders)
  end
end