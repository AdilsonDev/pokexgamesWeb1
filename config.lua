local config = require("lapis.config")
config("development", {
  mysql = {
    host = "127.0.0.1",
    user = "root",
    password = "1234",
    database = "meusite"
  },
  session_name = 'meusite',
  secret = 'Sylither Superkey'
})