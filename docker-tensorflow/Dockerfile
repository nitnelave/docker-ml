FROM nitnelave/tensorflow-dependencies
MAINTAINER Valentin Tolmer "valentin.tolmer@gmail.com"

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
