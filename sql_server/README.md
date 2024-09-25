## Tailwind's SQL Server Docker Container

Things aren't quite as easy to script up with SQL Server on Linux as they are for PG. Here are the steps to get going. I tried to make things easy by using Make... I like it so... hope you don't mind.

## Build The Image

Just run `make build` and the command will execute. If you want to know what's happening, have a look at the Makefile but basically it's running `docker build -t tailwind/sql_server .`, which will grab the things needed and then build it up.

## Launch with Make

Now you just need to run `make` and the container will be created for you. In addition, the tailwind SQL script will be executed and the tailwind database loaded. You should see this in the output.

You can now connect to localhost using `sa` and `P@ssword!`. Feel free to change that in the Dockerfile.

## Connect with MSSQL

You can also connect with the `mssql` client directly, or for your convenience I created a `make connect` command.

Have fun!
