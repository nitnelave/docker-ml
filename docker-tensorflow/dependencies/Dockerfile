FROM nitnelave/nvidia
MAINTAINER Valentin Tolmer "valentin.tolmer@gmail.com"

# Pick up some TF dependencies
RUN yum -y install \
        bc \
        curl \
        freetype-devel \
        gcc-gfortran \
        java-1.8.0-openjdk-devel \
        libpng12-devel \
        python-devel \
        python-pip \
        swig \
        vim \
        unzip \
        zip \
        && \
    yum clean all && \
    rm -rf /var/lib/apt/lists/*

# Install pip and some TF dependencies
RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        scipy \
        wheel \
        zmq \
        && \
    python -m ipykernel.kernelspec


# Download and build Bazel
RUN git clone https://github.com/bazelbuild/bazel && \
    cd bazel && \
    git checkout 0.2.0 && \
    ./compile.sh && \
    ln -s /bazel/output/bazel /bin/bazel

# Configure the build for our CUDA configuration.
ENV CUDA_TOOLKIT_PATH=/usr/local/cuda \
    CUDNN_INSTALL_PATH=/usr/local/cuda \
    TF_NEED_CUDA=1

# Download TensorFlow and third-party libraries
RUN git clone --recursive https://github.com/tensorflow/tensorflow.git && \
    cd tensorflow && \
    git checkout r0.8 && \
    ./configure && \
    bazel fetch //...
