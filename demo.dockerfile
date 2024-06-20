FROM mmumshad/ubuntu-ssh-enabled:latest

# Actualizar la lista de paquetes e instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libncurses5-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libffi-dev \
    liblzma-dev \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update

# Instalar Python 3.9
RUN apt-get install -y python3.9

# Instalar pip para Python 3.9
RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python3.9 get-pip.py

# Asegurar que distutils está disponible
RUN python3.9 -m pip install --upgrade pip setuptools wheel \
    && python3.9 -m pip install distutils

# Crear un alias para que python apunte a python3.9
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 \
    && update-alternatives --set python3 /usr/bin/python3.9

# Verificar la versión de Python instalada
RUN python3 --version

# CMD para iniciar el servicio SSH
CMD ["/usr/sbin/sshd", "-D"]
