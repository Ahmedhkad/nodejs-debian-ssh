# nodejs-debian-ssh

### Boilerplate to develope nodejs app on docker with an ability to easly connect by SSH in VSCode Remote SSH 
I used Official node image node:slim (latest) but its work with any other node tags .. exept Alpine! 

You can ignore RSA key and using root password instead just uncommend or add
``` Dockerfile
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
```
You can add git and use colorful terminal with zsh instead of bash, uncommend or add:
``` Dockerfile
RUN apt install git -y && bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
```
feel free to edit Dockerfile


## Installation
1. Clone the project from your terminal
   ``` bash
   git clone https://github.com/Ahmedhkad/nodejs-debian-ssh.git
   cd nodejs-debian-ssh
   ```
2. Edit or copy your public key to folder `/ssh-keys/for-docker` if you dont have one make one :)
   ``` cmd
    ssh-keygen -f any-name-here -t rsa
   
   ```
   Copy Public key (the small file) to `/ssh-keys/for-docker/` and Private key (big one) to PC `C:\Users\username\.ssh`
   
3. Run Docker-Compose to Build and Run the container
   ``` bash
   docker-compose up -d
   ```
4. In VSCode, install `Remote SSH` extension if not installed by defaulte
5. Editing Configuration Files in Windows `C:\Users\username\.ssh\config` or in VSCode `Remote-SSH: Open SSH Config`
   ``` yaml
   Host nodejs-slim-ssh
       HostName 192.168.x.xxx (IP or Domain your server)
       User root
       Port 2222
       IdentityFile /c:/Users/username/.ssh/private_rsa_key_in_pc
   ```

### Docker image file size
 After Installation size: ~265MB , this size could be diffrent on your server because its latest tag and also updated!
  - npm -v  9.8.0
  - node -v  v20.5.1
