# pokexgamesWeb1
Página web utilizando framework lapis

Utilizado valua e sha2 para a criação desse projeto:

	https://github.com/sailorproject/valua 
	https://github.com/Egor-Skriptunoff/pure_lua_SHA
	
Baixar valua.lua e sha2.lua e mover para o diretório openresty/lualib:

	sudo mv valua.lua /usr/local/openresty/lualib/
	sudo mv sha2.lua /usr/local/openresty/lualib/

Database:

	Mysql -> schema.sql 
	database_name = meusite
	
	Utilizado sha3_512 no username e password
	
	

