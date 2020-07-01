local Users = require 'models.users'
local sha = require 'sha2'

return function(self)
    
    if not self.session.user then
        self.title = 'Login'
        self.submitButton = 'Logar'
        self.login = true

        if self.params.password and self.params.username then
            local username = sha.sha3_512(self.params.username)
            local password = sha.sha3_512(self.params.password)
            local login = Users:fsearch(username, password)

            if not login then
                self.login_error = true
                self.error_msg = 'Autenticação inválida'
                return {render = "login"}
            else
                self.session.user = {
                    username = self.params.username,
                    login_date = os.date('Horário: %H:%M:%S - Dia: %d/%m/%Y')
                }
                return { redirect_to = '/perfil'}
            end
        end
        return { render = 'login' }
    end
    return { redirect_to = '/perfil'}
end

