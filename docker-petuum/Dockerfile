FROM nitnelave/nvidia-cudnn3

RUN yum -y install \
    libstdc++-static \
    openssh-server \
    python-devel \
    && yum remove -y gflags-devel \
    && yum clean all

RUN mkdir /var/run/sshd

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#StrictModes yes/StrictModes no/' /etc/ssh/sshd_config && \
    sed -i 's@HostKey .*@HostKey /root/.ssh/ssh_host_rsa_key@' /etc/ssh/sshd_config


RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh && rm -rf /root/.ssh/*

RUN git clone https://github.com/petuum/poseidon.git && \
    cd poseidon && \
    git clone https://github.com/nitnelave/third_party.git && \
    make -C third_party -j$(nproc) || make -C third_party && \
    make -j$(nproc) -C ps && \
    cp Makefile.config.example Makefile.config && \
    echo "USE_CUDNN := 1" >> Makefile.config && \
    sed -i 's/BLAS := atlas/BLAS := open/g' Makefile.config && \
    echo 'BLAS_INCLUDE := /usr/include/openblas' >> Makefile.config && \
    echo 'BLAS_LIB := /usr/lib64' >> Makefile.config

RUN cd poseidon && \
    make all -j$(nproc)

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
