require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # 1. Perguntar ao usuário seu username
    username = @view.ask_username
    # 2. Perguntar ao usuário sua senha
    password = @view.ask_password
    # 3. Procurar o repositório, o usuário a partir do username
    employee = @employee_repository.find_by_username(username)
    
    # 4. Verifica se a senha está correta
    if employee && employee.password == password # 5. Caso a senha for correta, o controller retorna o employee
      return employee  
    else # 6. Se não, dar erro e pedir p/ o usuário se logar novamente  
      @view.wrong_credentials
      sign_in
    end
  end
end