FROM ubuntu:12.04
MAINTENER Kazuya Yokogawa "mapk0y@gmail.com"

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server wget
RUN apt-get install -y python

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
RUN wget http://dev.mysql.com/get/Downloads/Connector-Python/mysql-connector-python_1.1.4-1ubuntu12.04_all.deb
RUN dpkg -i mysql-connector-python_1.1.4-1ubuntu12.04_all.deb
RUN wget http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-utilities_1.3.6-1ubuntu12.04_all.deb
RUN dpkg -i mysql-utilities_1.3.6-1ubuntu12.04_all.deb
ADD init.sql /tmp/
RUN (/usr/bin/mysqld_safe &); sleep 3; mysql -u root < /tmp/init.sql

CMD ["/usr/bin/mysqld_safe"]
