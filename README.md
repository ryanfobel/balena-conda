# balena-conda

This is a balena image for Raspberry Pi 4-64bit OS with a basic conda environment. It may be useful to anyone wanting to setup a Python data science stack (e.g., numpy, scipy, jupyter, matplotlib, pandas, etc.) on the Raspberry Pi4.

# Build Instructions

1. Build the docker image on the RPi at the given IP address

```sh
>balena build -a balena-conda -h 192.168.0.114 -p 2375 .
```

2. List the images on the Pi

```sh
>ssh root@192.168.0.114 -p 22222 balena-engine image ls

REPOSITORY                                                       TAG                      IMAGE ID            CREATED             SIZE
balena-conda_main                                                latest                   0e4e4314354f        2 hours ago         1.62GB
<none>                                                           <none>                   dd756fa21c86        3 hours ago         820MB
registry2.balena-cloud.com/v2/edfe2dda6fb67a903300f47858d2c835   delta-da764dacca32319b   4876327a744e        7 hours ago         1.68GB
balenalib/raspberrypi4-64                                        latest                   6bf3f55eb672        3 days ago          164MB
balenalib/raspberrypi4-64-python                                 3.8-build                5c2ccb06eb0a        4 days ago          817MB
balena/aarch64-supervisor                                        v12.4.6                  6b9eed135003        2 weeks ago         72.3MB
registry2.balena-cloud.com/v2/ee8a630b4962f1e2b4ad682dd9468f7a   latest                   6b9eed135003        2 weeks ago         72.3MB
balena-healthcheck-image                                         latest                   a29f45ccde2a        15 months ago       9.14kB
```

3. Save the docker image `balena-conda_main` on the pi and stream/import it into the docker service running on the laptop/desktop.

```sh
>ssh root@192.168.0.114 -p 22222 balena-engine save balena-conda_main | docker load

>docker image ls
REPOSITORY                        TAG       IMAGE ID       CREATED       SIZE
balena-conda_main                 latest    0e4e4314354f   2 hours ago   1.62GB
```

4. Tag the image with the proper username/image name for docker hub.
```sh
>docker tag balena-conda_main ryanfobel/raspberrypi4-64-conda
>docker image ls
REPOSITORY                        TAG       IMAGE ID       CREATED       SIZE
ryanfobel/raspberrypi4-64-conda   latest    0e4e4314354f   2 hours ago   1.62GB
balena-conda_main                 latest    0e4e4314354f   2 hours ago   1.62GB
```

5. Push the image to docker hub
```sh
>docker push ryanfobel/raspberrypi4-64-conda
```