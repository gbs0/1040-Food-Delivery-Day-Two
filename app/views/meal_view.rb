class MealView
  def ask_for_name
    puts "What's the recipe name?"
    print "> "
    gets.chomp
  end

  def ask_for_price
    puts "What's the recipe price?"
    print "> "
    gets.chomp.to_i
  end

  def display(list)
    list.each do |meal|
      puts "#{meal.id} - #{meal.name} | $#{meal.price}"
    end
  end
end