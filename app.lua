local lapis = require("lapis")
local app = lapis.Application()

app:enable("etlua")
app.layout = require "views.layout"

-- Controladores --
local index = require "controller.index"
local login = require "controller.login"
local create = require "controller.create"
local logout = require "controller.logout"
local perfil = require "controller.perfil"
local media = require "controller.media"
local suporte = require "controller.suporte"

-- Roteador de Links --
app:match("/", index)
app:match("/account/create", create)
app:match("/account/login", login)
app:match("/logout", logout)
app:match("/perfil", perfil)
app:match("/media", media)
app:match("/suporte", suporte)

-- Tratamento de erros de Página --
app.handle_404 = index

return app
