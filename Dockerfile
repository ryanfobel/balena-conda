FROM balenalib/raspberrypi4-64

RUN install_packages wget && \
    wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh && \
    chmod 755 Miniforge3-Linux-aarch64.sh && ./Miniforge3-Linux-aarch64.sh -b && \
    ~/miniforge3/bin/conda init bash && rm Miniforge3-Linux-aarch64.sh

# Add conda to the path
ENV PATH /root/miniforge3/bin:$PATH

# Set our working directory
WORKDIR /usr/src/app

CMD bash
