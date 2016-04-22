FROM nitnelave/tensorflow-dependencies
MAINTAINER Valentin Tolmer "valentin.tolmer@gmail.com"

# Build TensorFlow.
RUN cd tensorflow  && \
    bazel build -c opt --local_resources 2048,1.0,1.0 --config=cuda tensorflow/tools/pip_package:build_pip_package && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/pip && \
    pip install --no-cache-dir --upgrade /tmp/pip/tensorflow-*.whl


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
