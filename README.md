# Docker images for Deep Learning

This repository aims at delivering trouble-free docker images for people
wanting to try out deep learning frameworks.

See the respective README files to learn how to start and use them.

`docker-nvidia` is the base image, providing an install of cuda 7.5 on centos7,
with CUDNN4 and common tools for compiling a framework.

You can build the images with the Makefiles provided:
  - from the top directory :
    `make caffe`
  - from the projects' directory:
    `cd docker-caffe; make`

If you have trouble accessing the GPUs from inside the Docker containers, make
sure you have matching versions of the CUDA drivers.

Your own version (as provided by `yum info cuda-drivers`) should match the
number in
[docker-nvidia/Dockerfile](https://github.com/nitnelave/docker-ml/blob/master/docker-nvidia/Dockerfile). 
If necessary, change the version in the Dockerfile and rebuild the images.
