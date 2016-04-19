FROM nitnelave/nvidia

RUN yum -y install \
    openssh-server \
    && yum clean all

RUN mkdir /var/run/sshd

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#StrictModes yes/StrictModes no/' /etc/ssh/sshd_config && \
    sed -i 's@HostKey .*@HostKey /root/.ssh/ssh_host_rsa_key@' /etc/ssh/sshd_config


RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh && rm -rf /root/.ssh/*

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
