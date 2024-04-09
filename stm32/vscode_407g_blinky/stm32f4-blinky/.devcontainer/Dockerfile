FROM debian:bookworm

RUN apt-get update

RUN apt-get install \
    git wget cmake  stlink-tools \
    # build tools for openocd
    libhidapi-hidraw0 \
    libusb-0.1-4 \
    libusb-1.0-0 \
    libhidapi-dev \
    libusb-1.0-0-dev \
    libusb-dev \
    libtool \ 
    make \
    automake \
    pkg-config \
    tclsh \
    telnet \
    unzip \
    zenity \
    libncurses5\
    -y


# Install arm-none-eabi compiler
RUN wget https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v9.3.1-1.1/xpack-arm-none-eabi-gcc-9.3.1-1.1-linux-x64.tar.gz
RUN tar xf xpack-arm-none-eabi-gcc-9.3.1-1.1-linux-x64.tar.gz
RUN cp -rf xpack-arm-none-eabi-gcc-9.3.1-1.1/* /usr/local/
RUN rm -rf xpack-arm-none-eabi-gcc-9.3.1-1.1

# build openocd from source
RUN git clone https://github.com/openocd-org/openocd.git \
    && cd openocd \
    && ./bootstrap \ 
    && ./configure --enable-stlink \
    && make -j"$(nproc)" \
    && make install-strip \
    && cd .. \
    && rm -rf openocd

# Install CubeCLT
# Download from my own Google Drive, bause ST won't allow wget download
RUN wget wget --no-check-certificate 'https://drive.usercontent.google.com/download?id=1yc4HVDBCQRN71aGGYeCx6OMg8Rkwuxpe&export=download&confirm=t&uuid=b4873ee7-34e3-4df1-966c-474ee172ca22' -r -A 'uc*' -e robots=off -nd -O cubeclt.sh.zip
RUN unzip cubeclt.sh.zip
RUN chmod +x st-stm32cubeclt_1.15.0_20695_20240315_1429_amd64.sh
RUN yes | ./st-stm32cubeclt_1.15.0_20695_20240315_1429_amd64.sh --quiet --nox11
RUN mv makeself_dir_ww3tyB/y/ /home/cubeCLT


CMD bin/bash