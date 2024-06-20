# Curso de Ansible

Ejecutar el siguiente comando

    vagrant up


# Construir imagen docker
docker build -t avilaqdaniel/ubuntu2204-ssh .

# Remove key from SSH
ssh-keygen -f "/home/daniel/.ssh/known_hosts" -R "172.21.0.2"

ansible target1 -m ping -i ./inventory
ansible all -m ping

docker run -itd --name demo -p 2224:22 avilaqdaniel/ubuntu2204-ssh:0.02