return function(self)

    if self.session.user then
    --print('>>>>>>>>>>>>>>>>>>>>>>>'..self.session.user.username..'<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<')
   -- print('>>>>>>>>>>>>>>>>>>>>>>>'..self.session.user.login_date..'<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<')

    return {render = "perfil"}
    end
    return {redirect_to = 'index'}
end