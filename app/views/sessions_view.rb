class SessionsView
  def ask_username
    puts "Employee username?"
    print "> "
    gets.chomp
  end
  
  def ask_password
    puts "Employee password?"
    print "> "
    gets.chomp
  end
  
  def wrong_credentials
    puts "Wrong Credentials, try again!"
  end

  def display_riders(list)
    list.each do |customer|
      puts "#{customer.id} - #{customer.username} | Role: #{customer.role}"
    end
  end
end