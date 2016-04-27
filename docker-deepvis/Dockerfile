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

#RUN update-alternatives  --set libblas.so.3 \
#        /usr/lib64/libopenblas.so.3 && \
#    update-alternatives --set liblapack.so.3 \
#        /usr/lib64/liblapack.so.3


RUN cd /caffe && \
    git remote add yosinski https://github.com/yosinski/caffe.git && \
    git fetch --all && \
    git checkout --track -b deconv-deep-vis-toolbox yosinski/deconv-deep-vis-toolbox && \
    make clean && \
    make -j$(nproc) && \
    make -j$(nproc) pycaffe

RUN git clone https://github.com/yosinski/deep-visualization-toolbox && \
    cd deep-visualization-toolbox && \
    cp models/caffenet-yos/settings_local.template-caffenet-yos.py settings_local.py
