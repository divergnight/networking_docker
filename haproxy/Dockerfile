# Select origin image.
FROM ubuntu


# Set container time zone.
RUN ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo 'Europe/Paris' > /etc/timezone


# Install haproxy server and some useful packages.
RUN apt update -y
RUN apt install -y net-tools vim curl iputils-ping
RUN apt install -y haproxy



# Make the server permanently active.
RUN sed -i '126 a while [ 1 ]; do sleep 30; done;' /etc/init.d/haproxy


# Automatically start the program when the container is turned on.
ENTRYPOINT ["/etc/init.d/haproxy", "start"]
