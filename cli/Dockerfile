FROM ubuntu:focal

RUN apt-get update
RUN apt-get install -y gnupg2
RUN apt-get install curl -y
RUN apt-get -y install sudo
RUN curl -sL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN curl -sL https://artifacts.cloud.mov.ai/repository/movai-applications/gpg | apt-key add -
RUN echo 'deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable'>> /etc/apt/sources.list
RUN echo 'deb [arch=all] https://artifacts.cloud.mov.ai/repository/ppa-main main main'>> /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt -y install python3-pip docker-ce docker-ce-cli containerd.io movai-cli movai-service
RUN pip install six systemd

ENTRYPOINT ["/etc/init.d/movai-service", "start"]