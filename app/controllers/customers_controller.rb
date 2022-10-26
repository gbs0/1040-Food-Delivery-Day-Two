require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def add
    # 1. Perguntar ao user o nome do prato
    name = @view.ask_for_name    
    # 2. Perguntar ao user o preço do prato
    address = @view.ask_for_address
    # 3. Criar um novo objeto customer
    new_customer = Customer.new(name: name, address: address)
    # 4. Adicionar a customer ao repositório
    @customer_repository.add(new_customer)
  end

  def list
    # 1. Pegar todas as customers disponiveis no repositório
    # 2. Chamo a view para mostrar a lista de customers
    @view.display(@customer_repository.all)
  end
end