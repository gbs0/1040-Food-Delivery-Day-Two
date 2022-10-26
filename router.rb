class Router
  def initialize(sessions_controller, customers_controller, meals_controller)
    @sessions_controller = sessions_controller
    @customers_controller = customers_controller
    @meals_controller = meals_controller
    @running = true
  end

  def run
    employee = @sessions_controller.sign_in
    while @running
      employee.manager? ? print_manager_menu : print_rider_menu
      action = ask_action
      employee.manager? ? dispatch_manager_action(action) : dispatch_rider_action(action)
    end
  end

  private

  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then @running = false
    else
      puts "Wrong action"
    end
  end
  
  def dispatch_rider_action(action)
    case action
    when 9 then @running = false
  end

  def print_manager_menu
    puts "----------------------"
    puts "1. Add a Meal"
    puts "2. List all available Meals"
    puts "----------------------"
    puts "3. Add a Customer"
    puts "4. List all available Meals"
    puts "----------------------"
    puts "9. Exit"
    print "\n"
  end

  def print_rider_menu
    puts "----------------------"
    puts "1. List my orders"
    puts "2. Mark order as delivered!"
    puts "----------------------"
    puts "9. Exit"
    print "\n"
  end
  
  def ask_action
    puts "What do you want to do next?"
    print "> "
    gets.chomp.to_i
  end
end