FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

#set inv
ENV KAFKA_VER 3.4.0
ENV HOME /root

#set password
RUN echo 'root:root' |chpasswd

#replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#make .ssh
RUN mkdir ${HOME}/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#install git, vim, wget
RUN apt-get update && apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN apt-get install -y lsof
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y curl
RUN apt-get install -y telnet
RUN apt-get install -y tree
RUN apt-get install -y gradle
RUN apt-get install -y net-tools #netstat

#setting vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git
RUN mkdir -p ${HOME}/.vim/bundle
RUN mv Vundle.vim ${HOME}/.vim/bundle
ADD ./.vimrc ${HOME}/

#install kafka
RUN apt-get install -y tar
RUN apt-get install -y openjdk-11-jdk
#RUN cd ${HOME} && wget http://apache.mirror.cdnetworks.com/kafka/${KAFKA_VER}/kafka_2.12-${KAFKA_VER}.tgz
RUN cd ${HOME} && wget https://downloads.apache.org/kafka/${KAFKA_VER}/kafka_2.12-${KAFKA_VER}.tgz
RUN cd ${HOME} && tar -xzf kafka_2.12-${KAFKA_VER}.tgz
RUN cd ${HOME} && rm kafka_2.12-${KAFKA_VER}.tgz
RUN cd ${HOME} && mv kafka_2.12-${KAFKA_VER} kafka

#script
ADD ./run ${HOME}/run
ADD ./script ${HOME}/script

EXPOSE 22 9092

CMD ["/usr/sbin/sshd", "-D"]
