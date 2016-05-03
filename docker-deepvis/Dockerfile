FROM nitnelave/scikit
MAINTAINER Valentin Tolmer "valentin.tolmer@gmail.com"

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
