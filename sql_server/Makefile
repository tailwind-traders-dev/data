load: launch
	docker exec -it sql_server /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssword! -d master -i /scripts/tailwind_ss.sql

launch:
	docker run -d --name sql_server -p 1433:1433 tailwind/sqlserver:latest

connect:
	mssql -u sa -p P@ssword! -d tailwind

build:
	docker build -t tailwind/sqlserver .

clean:
	docker kill sql_server && docker rm sql_server