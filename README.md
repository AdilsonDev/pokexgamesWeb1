# pokexgamesWeb1
Página web utilizando framework lapis

Utilizado valua e sha2 para a criação desse projeto:

	https://github.com/sailorproject/valua 
	https://github.com/Egor-Skriptunoff/pure_lua_SHA
	
Baixar valua.lua e sha2.lua e mover para o diretório openresty/lualib:

	sudo mv valua.lua /usr/local/openresty/lualib/
	sudo mv sha2.lua /usr/local/openresty/lualib/

Database:

	utilizado postgres (https://www.postgresql.org/)

	database meusite, tabela usuarios com values id (primary_key incremental), username VARCHAR(128), password VARCHAR(128)
	
	Utilizado sha3_512 no username e password
	
	

