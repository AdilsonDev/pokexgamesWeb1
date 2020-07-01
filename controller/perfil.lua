return function(self)

    if self.session.user then
        return {render = "perfil"}
    end
    return {redirect_to = 'index'}
end