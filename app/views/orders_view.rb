class OrdersView
  def ask_for_index
    puts "What the index of your choice?"
    print "> "
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, index| 
      puts "#{index + 1}. #{order.employee.username} must deliver #{order.meal.name} to #{order.customer.name}"
    end
  end
end