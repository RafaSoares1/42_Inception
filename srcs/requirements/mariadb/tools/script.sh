tail -f /dev/null

# Start the MariaDB service
service mariadb start

#-uroot: This option specifies the MariaDB user to connect as, in this case, the user is "root." The -u option is followed by the username.
#-e: This option allows you to execute a statement or query directly from the command line. In this case, it is followed by the SQL statement within double quotes 

# Create a database if it does not already exist
mariadb -uroot -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create a user if it does not already exist, identified by the specified password
mariadb -uroot -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant all privileges on the specified database to the specified user, allowing access from any host
mariadb -uroot -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Change the password for the 'root' user on the local machine
mariadb -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

# Shut down MariaDB, waiting for all slaves to catch up. a "slave" typically refers to a server or instance that replicates data from a "master" server.
mariadb-admin -uroot -p$SQL_ROOT_PASSWORD --wait-for-all-slaves shutdown

# Start the MariaDB server in a safe mode
mysqld_safe


#HOW TO CHECK IF EVERYTHING IS OK SO FAR:
#1)build the image;
#2)docker run -d 48331fc16a65 (run the image)
#3)docker exec -it f35ffa4c266a(ID Container) bash
#4)check if env variables are ok:
#5)Run the MDB service: mysql -u theuser -p thedatabase
#6)if prompt is: MariaDB [thedatabase]> it means that all is ok.
#7)SHOW TABLES; #For now, we don't have any table, so it'll return an empty set, But at the end of the project, it'll have some tables created by wordpress.
#8) SHOW DATABASES;  command in MariaDB, and it has displayed a list of databases. In this case, you have two databases:
#DataBaseMDB
#information_schema
#The information_schema database is a system database that contains metadata about other databases on the MariaDB server.