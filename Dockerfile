FROM ubuntu:22.04

# Actualizar la lista de paquetes e instalar dependencias necesarias
RUN apt update && apt install -y openssh-server sudo

# Crear directorio para sshd
RUN mkdir /var/run/sshd

# Establecer la contraseña de root
RUN echo 'root:042006' | chpasswd

# Permitir el inicio de sesión de root a través de SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Corregir la configuración de PAM para evitar que el usuario sea desconectado
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

# Configurar entorno para hacer visible el SSH
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Exponer el puerto 22 para SSH
EXPOSE 22

# CMD para iniciar el servicio SSH
CMD ["/usr/sbin/sshd", "-D"]
