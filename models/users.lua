local Model = require('lapis.db.model').Model
local Users = Model:extend('users')

function Users:fsearch(user, pass)
    local query = 'WHERE username = ? AND password = ? LIMIT 1'
    local fsearch_response = self:select(query, user, pass)
    if #fsearch_response == 1 then
        return true 
    end
    return false
end

function Users:fmake(user, pass)
    local query = 'WHERE username = ? LIMIT 1'
    local fmake_response = self:select(query, user)

    if #fmake_response == 0 then
        local p = self:create({
            username = user,
            password = pass
            })
        return true
    end
    return false
    
end

return Users