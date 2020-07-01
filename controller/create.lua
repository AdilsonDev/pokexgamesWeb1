local sha = require 'sha2'
local Users = require 'models.users'
local check = require ('valua')

return function(self)
    
    if not self.session.user then
        self.title = 'Criar Conta'
        self.submitButton = 'Criar'    
        self.login = false
        self.login_error = false

        local check_usrpass = check:new().not_empty().len(3,15)

        self.continue_usr, self.err = check_usrpass(self.params.username)
        self.continue_pass, self.err = check_usrpass(self.params.password)

        if self.params.username ~= nil and self.params.password ~= nil then
            if self.continue_usr and self.continue_pass  then
                local user = sha.sha3_512(self.params.username)
                local password = sha.sha3_512(self.params.password)
                local logged = Users:fmake(user, password)          
                
                if not logged then
                    self.login_error = true
                    self.error_msg = 'Nome de usuário já existe'
                else
                    self.success_login = true   
                    self.success_msg = 'Criado com sucesso!'                   
                end
                return {render = 'login' }
            end
            self.login_error = true
            self.error_msg = 'Usuário e senha precisam ter entre 3 e 15 caracteres'
        end
        return { render = 'login' }
    end
    return { redirect_to = '/perfil'}
end
