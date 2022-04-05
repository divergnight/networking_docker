# Select origin image.
FROM ubuntu


# Set container time zone.
RUN ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo 'Europe/Paris' > /etc/timezone


# Install apache server and some useful packages.
RUN apt update -y
RUN apt install -y net-tools vim curl iputils-ping
RUN apt install -y apache2


# Make the server permanently active.
RUN sed -i '215 a while [ 1 ]; do sleep 30; done;' /usr/sbin/apachectl


# Automatically start the program when the container is turned on.
ENTRYPOINT ["/usr/sbin/apachectl", "start"]
