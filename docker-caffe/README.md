# Caffe Docker

BVLC version of Caffe, on `master` branch, on CUDNN4.

The repository is present at `/caffe` in the Docker.

Example docker start:

`docker run -it $(for device in \`ls /dev/nvidia*\`; do echo -n "--device $device "; done) nitnelave/caffe`
