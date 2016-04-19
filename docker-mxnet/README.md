# MXNet Docker

This is an image for the MXNet framework, with an SSH client.

It has been compiled with kvstore enabled, for distributed learning.

You can find the repository in `/mxnet`.

## SSH Setup

This is an SSH docker, so you will need to setup the keys. The easiest is to
have a key shared by all the instances (if you want to run multiple instances)
to enable password-less SSH.

You need a server key as well as a client key. Once you setup all that in a
folder, you should have the following files:

- authorized_keys
- id_rsa
- id_rsa.pub
- ssh_host_rsa_key
- ssh_host_rsa_key.pub

In the `authorized_keys` file, simply put the content of the id_rsa.pub and
your own key. Now you can mount that folder as `/root/.ssh`, and you should be
set. Make sure the permissions are 700.

## Docker command

Example docker command:

`docker run -itd -v /path/to/your/ssh/folder:/root/.ssh $(for device in $(ls /dev/nvidia*); do echo -n "--device $device "; done) --name petuum0 nitnelave/petuum`

## Host file

If you want to run with more than one docker locally to run some tests, you can
start several instances of the docker. If they are named `mxnet0`, `mxnet1`,
etc, you can use the `generate_hostfile.sh` script provided.
