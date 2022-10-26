require 'csv'
require 'pry'

require_relative '../models/order'

class OrderRepository
  def initialize(csv, meal_repo, employee_repo, customer_repo)
    @csv = csv
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    @next_id = 1
    @orders = []
    load_csv if File.exist?(@csv)
  end

  def mark_as_delivered(order)
    @orders.each { |order| order.deliver! if order == order}
    save_csv
  end

  def my_undelivered_orders(employee)
    @orders.select { |order| order.employee == employee && !order.delivered? }
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def add(order)
    binding.pry
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv, 'w') do |csv|
      csv << %w[id delivered meal_id employee_id customer_id]
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      @orders << Order.new(row)
    end
    @next_id = @orders.empty? ? 1 : (@orders.last.id + 1)
  end
end