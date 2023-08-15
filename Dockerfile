FROM node:slim
LABEL maintainer="Ahmed Al-Omairi" email="alomairi@mail.ru" version="1.2" location="Iraq" type="node-debian-ssh"

# --- SSH Keys setup
WORKDIR /root/.ssh/
RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh 
COPY ./ssh-keys/for-docker/* ./
RUN cat  ~/.ssh/* >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys

# --- curl or wget for VSCode Remote
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
 apt-get install --no-install-recommends --assume-yes \ 
 wget openssh-server \
 && rm -rf /var/lib/apt/lists/*
# RUN  echo 'root:toor' | chpasswd
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN service ssh start

WORKDIR /app

# --- Add git and oh-my-bash
# RUN apt install git -y && bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

EXPOSE 8080 3000 5000 22 443

CMD ["/usr/sbin/sshd", "-D"]
