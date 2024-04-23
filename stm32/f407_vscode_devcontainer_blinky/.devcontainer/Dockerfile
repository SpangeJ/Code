FROM dockerspange/stm32devcontainer:2024-04-23

RUN rm -f /root/Downloads/st-stm32cubeclt_1.15.0_20695_20240315_1429_amd64.sh

# build openocd from source
RUN git clone https://github.com/openocd-org/openocd.git \
    && cd openocd \
    && ./bootstrap \ 
    && ./configure --enable-stlink \
    && make -j"$(nproc)" \
    && make install-strip \
    && cd .. \
    && rm -rf openocd

RUN wget https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v13.2.1-1.1/xpack-arm-none-eabi-gcc-13.2.1-1.1-linux-x64.tar.gz \
    && tar xf xpack-arm-none-eabi-gcc-13.2.1-1.1-linux-x64.tar.gz \
    && cp -rf xpack-arm-none-eabi-gcc-13.2.1-1.1/* /usr/local/ \
    && cp -rf xpack-arm-none-eabi-gcc-13.2.1-1.1/* /opt/st/stm32cubeclt_1.15.0/GNU-tools-for-STM32/ \
    && rm -rf xpack-arm-none-eabi-gcc-13.2.1-1.1*

CMD bin/bash
