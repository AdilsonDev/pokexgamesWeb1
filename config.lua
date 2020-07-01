local config = require("lapis.config")
config("development", {
  postgres = {
    host = "127.0.0.1",
    user = "meusite",
    password = "123",
    database = "meusite"
  },
  session_name = 'meusite',
  secret = 'Sylither Superkey'
})