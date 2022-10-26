class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer, :delivered
  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @employee = attributes[:employee]
    @customer = attributes[:customer]
    @delivered = attributes[:delivered].nil? ? false : attributes[:delivered]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end