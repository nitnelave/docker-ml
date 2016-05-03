FROM nitnelave/caffe
MAINTAINER Valentin Tolmer "valentin.tolmer@gmail.com"

RUN ln -s /usr/lib64/libblas.so.3 /usr/lib64/libblas.so && \
    ln -s /usr/lib64/liblapack.so.3 /usr/lib64/liblapack.so

RUN yum -y install \
    freetype-devel \
    gcc-gfortran \
    libjpeg-turbo-devel \
    libpng-devel \
    python-devel \
    python-pip \
    numpy-f2py \
    opencv-python \
    && yum clean all && \
    pip install --no-cache-dir numpy matplotlib cython protobuf && \
    pip install --no-cache-dir scipy && \
    pip install --no-cache-dir scikit-image
