# TensorFlow Docker

Tensorflow with Jupyter setup, with CUDA 7.5 and CUDNN4, on CentOS7.

The repository can be found in `/tensorflow`.

## Jupyter

Jupyter is running on port 8888. The root is in `/notebooks`, so feel free to
mount your own notebooks, or to get the sample notebooks from the TensorFlow
repository.

## TensorBoard

TensorBoard is running on port 6006.

## Building the image

The image cannot be built on DockerHub, so you are encouraged to build it
yourself:

`docker build -t nitnelave/tensorflow .`

## Example docker run command


`docker run -itd $(for device in $(ls /dev/nvidia*); do echo -n "--device $device "; done) -p 8888:8888 -p 6006:6006 -v /path/to/your/notebooks:/notebooks nitnelave/tensorflow`
