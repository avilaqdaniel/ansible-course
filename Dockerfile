FROM mmumshad/ubuntu-ssh-enabled:latest

RUN apt-get update && apt-get install -y sshpass

CMD ["/usr/sbin/sshd", "-D"]