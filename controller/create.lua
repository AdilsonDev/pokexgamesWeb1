local sha = require 'sha2'
local Usuarios = require 'models.users'
local check = require ('valua')

return function(self)
    
    if not self.session.user then
        self.titulo = 'Criar Conta'
        self.botaoSubmit = 'Criar'    
        self.logar = false
        self.falha_login = false

        local check_usrpass = check:new().not_empty().len(3,15)

        self.continue_usr, self.err = check_usrpass(self.params.username)
        self.continue_pass, self.err = check_usrpass(self.params.password)

        if self.params.username ~= nil and self.params.password ~= nil then
            if self.continue_usr and self.continue_pass  then
                local usuario = sha.sha3_512(self.params.username)
                local senha = sha.sha3_512(self.params.password)
                local logado = Usuarios:criar(usuario, senha)          
                
                if not logado then
                    self.falha_login = true
                    self.error_msg = 'Nome de usuário já existe'
                else
                    self.success_login = true   
                    self.success_msg = 'Criado com sucesso!'                   
                end

                return {render = 'login' }
            end

            self.falha_login = true
            self.error_msg = 'Usuário e senha precisam ter entre 3 e 15 caracteres'
        end

        return { render = 'login' }
    end
    return { redirect_to = '/perfil'}
end
