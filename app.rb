require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/order_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/orders_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'router'

customer_csv = 'data/customers.csv'
customer_repository = CustomerRepository.new(customer_csv)
customers_controller = CustomersController.new(customer_repository)

meal_csv = 'data/meals.csv'
meal_repository = MealRepository.new(meal_csv)
meals_controller = MealsController.new(meal_repository)

employee_csv = 'data/employees.csv'
employee_repository = EmployeeRepository.new(employee_csv)

order_csv = 'data/orders.csv'
order_repository = OrderRepository.new(order_csv, meal_repository, employee_repository, customer_repository)
orders_controller = OrdersController.new(meal_repository, customer_repository, employee_repository, order_repository)
sessions_controller = SessionsController.new(employee_repository)


router = Router.new(sessions_controller,customers_controller, meals_controller, orders_controller)
router.run