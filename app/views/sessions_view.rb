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
end