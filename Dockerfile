# Dockerfile
FROM ruby:2.1-onbuild

# adding UH repositories
RUN touch /etc/apt/sources.list.d/uh.list
RUN echo "deb http://ubuntu.uh.cu/ubuntu trusty main restricted universe multiverse" > /etc/apt/sources.list.d/uh.list
RUN chown root: /etc/apt/sources.list.d/uh.list
RUN chmod 600 /etc/apt/sources.list.d/uh.list

# Install apache and passenger
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
RUN touch /etc/apt/sources.list.d/passenger.list
RUN echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main" > /etc/apt/sources.list.d/passenger.list
RUN chown root: /etc/apt/sources.list.d/passenger.list
RUN chmod 600 /etc/apt/sources.list.d/passenger.list

RUN apt-get update
RUN apt-get install -y apache2

RUN apt-get install -y libapache2-mod-passenger

RUN a2enmod passenger
RUN service apache2 restart