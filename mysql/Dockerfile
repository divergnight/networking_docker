# Select origin image.
FROM ubuntu


# Set container time zone.
RUN ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo 'Europe/Paris' > /etc/timezone

# Install mysql server and some useful packages.
RUN apt update -y
RUN apt install -y net-tools vim curl iputils-ping
RUN apt install -y mysql-server


# Set root password for database access.
RUN /etc/init.d/mysql start && mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root'" && mysql -e "FLUSH PRIVILEGES"
RUN /etc/init.d/mysql stop


# Make the server permanently active.
RUN sed -i '190 a while [ 1 ]; do sleep 30; done;' /etc/init.d/mysql


# Automatically start the program when the container is turned on.
ENTRYPOINT ["/etc/init.d/mysql","start"]
