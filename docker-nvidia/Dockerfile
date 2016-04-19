FROM nvidia/cuda:7.5-cudnn4-devel-centos7
MAINTAINER Valentin Tolmer "valentin.tolmer@gmail.com"

# Repository for recent packages
#
# Needed for gflags-devel, among others
RUN yum -y install epel-release && yum clean all

# Common needed packages
RUN yum -y install \
    autoconf \
    automake \
    boost-devel \
    cuda-runtime-7-5 \
    libtool \
    bzip2 \
    gcc \
    gcc-c++ \
    git \
    gflags-devel \
    glog-devel \
    hdf5-devel \
    leveldb-devel \
    lmdb-devel \
    libuuid-devel \
    make \
    numactl-devel \
    opencv-devel \
    openblas-devel \
    protobuf-devel \
    psmisc \
    snappy-devel \
    wget \
    which \
    && yum -y update \
    && yum clean all

