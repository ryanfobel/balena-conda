[![build-image](https://github.com/ryanfobel/balena-conda/actions/workflows/main.yml/badge.svg)](https://github.com/ryanfobel/balena-conda/actions/workflows/main.yml)

# balena-conda

This is a [Raspberry Pi] 4-64bit [balena] image with a basic [conda]/[miniforge] environment. It provides access to the standard [Python] data science stack (e.g., numpy, jupyter, matplotlib, pandas, etc.) and libaries for interacting with the [Raspberry Pi] hardware (e.g., smbus2, RPi.GPIO, adafruit-blinka, pyusb, pyserial, pyftdi) on the [Raspberry Pi] 4.

## Build Instructions

1. Build the docker image using [buildx and QEMU emulation](https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408):

```sh
> docker buildx build . --pull --build-arg BALENA_ARCH=aarch64 --platform=linux/arm64 --file Dockerfile.raspberrypi4-64 \
    --tag ryanfobel/raspberrypi4-64-conda --load
```

2. Push the image to docker hub
```sh
> docker push ryanfobel/raspberrypi4-64-conda
```

**Note:** these steps are performed automatically every time a commit or tag is pushed to this repository via a [GitHub Action](https://github.com/ryanfobel/balena-conda/blob/main/.github/workflows/main.yml).

## Use this as a base image for your own balena `Dockerfile`

Include the following line at the top of your `Dockerfile`:

```
FROM ryanfobel/raspberrypi4-64-conda
```

[Raspberry Pi]: https://www.raspberrypi.org
[balena]: https://www.balena.io
[conda]: https://conda.io
[miniforge]: https://github.com/conda-forge/miniforge
[Python]: https://www.python.org/
