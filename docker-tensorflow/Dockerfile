FROM nitnelave/nvidia

# Pick up some TF dependencies
RUN yum -y install \
        bc \
        curl \
        freetype-devel \
        java-1.8.0-openjdk-devel \
        libpng12-devel \
        python-devel \
        swig \
        vim \
        unzip \
        && \
    yum clean all && \
    rm -rf /var/lib/apt/lists/*

# Install pip and some TF dependencies
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py && \
    pip --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        scipy \
        zmq \
        && \
    python -m ipykernel.kernelspec


# Install the most recent bazel release.
ENV BAZELRC=/root/.bazelrc BAZEL_VERSION=0.2.1

RUN mkdir /bazel && \
    cd /bazel && \
    # Running bazel inside a `docker build` command causes trouble, cf:
    #   https://github.com/bazelbuild/bazel/issues/134
    # The easiest solution is to set up a bazelrc file forcing --batch.
    echo "startup --batch" >>/root/.bazelrc && \
    # Similarly, we need to workaround sandboxing issues:
    #   https://github.com/bazelbuild/bazel/issues/418
    echo "build --spawn_strategy=standalone --genrule_strategy=standalone" >>/root/.bazelrc && \
    curl -fSsL -O https://github.com/bazelbuild/bazel/releases/download/$BAZEL_VERSION/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    curl -fSsL -o /bazel/LICENSE.txt https://raw.githubusercontent.com/bazelbuild/bazel/master/LICENSE.txt && \
    chmod +x bazel-*.sh && \
    ./bazel-$BAZEL_VERSION-installer-linux-x86_64.sh && \
    cd / && \
    rm -f /bazel/bazel-$BAZEL_VERSION-installer-linux-x86_64.sh

# Configure the build for our CUDA configuration.
ENV CUDA_TOOLKIT_PATH=/usr/local/cuda \
    CUDNN_INSTALL_PATH=/usr/local/cuda \
    TF_NEED_CUDA=1

# Download and build TensorFlow.
RUN git clone --recursive https://github.com/tensorflow/tensorflow.git && \
    cd tensorflow && \
    git checkout r0.8 && \
    ./configure && \
    bazel build -c opt --config=cuda tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/pip && \
    pip install --upgrade /tmp/pip/tensorflow-*.whl



# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

# TensorBoard, IPython
EXPOSE 6006 8888

RUN mkdir /notebooks
WORKDIR "/notebooks"

CMD ["/run_jupyter.sh"]
