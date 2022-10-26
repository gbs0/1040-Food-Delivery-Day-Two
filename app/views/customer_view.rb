class CustomerView
  def ask_for_name
    puts "What's the full name of customer?"
    print "> "
    gets.chomp
  end

  def ask_for_address
    puts "What's the customer address?"
    print "> "
    gets.chomp
  end

  def display(list)
    list.each do |customer|
      puts "#{customer.id} - #{customer.name} | 🏡 #{customer.address}"
    end
  end
end