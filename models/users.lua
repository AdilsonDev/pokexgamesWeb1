local Model = require('lapis.db.model').Model
local usuarios = Model:extend('usuarios')

function usuarios:buscar(user, pass)
    local query = 'WHERE username = ? AND password = ? LIMIT 1'
    local resposta = self:select(query, user, pass)
    if #resposta == 1 then
        return true 
    end
    return false
end

function usuarios:criar(user, pass)
    local query = 'WHERE username = ? LIMIT 1'
    local resposta_busca = self:select(query, user)

    if #resposta_busca == 0 then
        local p = self:create({
            username = user,
            password = pass
            })
        return true
    end
    return false
    
end

return usuarios