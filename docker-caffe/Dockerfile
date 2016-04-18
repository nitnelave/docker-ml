FROM nitnelave/nvidia
MAINTAINER Valentin Tolmer "valentin.tolmer@gmail.com"

RUN cd / && git clone https://github.com/BVLC/caffe.git && cd caffe && \
    cp Makefile.config.example Makefile.config && \
    echo "USE_CUDNN := 1" >> Makefile.config && \
    sed -i 's/:= atlas/:= open/' Makefile.config && \
    echo "BLAS_INCLUDE := /usr/include/openblas/" >> Makefile.config && \
    echo "BLAS_LIB := /usr/lib64" >> Makefile.config && \
    make -j8 && \
    ln -s  /caffe/.build_release/tools/caffe /usr/bin/caffe


