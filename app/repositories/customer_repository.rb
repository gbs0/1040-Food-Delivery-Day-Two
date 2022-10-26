require_relative '../models/customer'
require 'csv'

class CustomerRepository
  def initialize(csv)
    @csv = csv
    @id = 1
    @customers = []
    load_csv if File.exists?(@csv)
  end
  
  def all
    @customers
  end

  def add(customer)
    customer.id = @id
    @customers << customer
    @id += 1
    save_csv
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  def save_csv
    CSV.open(@csv, 'w') do |row|
      row << %w[id name address]
      @customers.each do |customer|
        row << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
    @id = @customers.empty? ? 1 : (@customers.last.id + 1)
  end
end