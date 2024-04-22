# Make an STM32F407G-DISC1 blink and write to serial port on button press

This code connects to a STM32F407G-DISC1 developer board.  
Upon succesfull upload the orange LED will flash on/off. If you press the blue button it wil flash slower and write to Seriell Monitor.  

## How to reproduce

### This folder is generated from STM32CubeMX

The project is initilized from the CubeMX as a STM32F407G-DISC1 project where **UART2** is enabled and the project is set up to use a **Makefile**.  

### Editing in VScode

Edit done is to add the following lines to Core/Src/main.c:  
`HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_13);`  
`HAL_Delay(150);`  
`if(HAL_GPIO_ReadPin(B1_GPIO_Port, B1_Pin) == GPIO_PIN_RESET){`  
    `HAL_Delay(150);`  
    `HAL_UART_Transmit(&huart2, (uint8_t *)message, strlen(message), 100);`  
`}`  

Inside the `while (1)` loop

## Toubleshooting

Install the STM32CubeMX and STM32Cubeclt at ~/st/:  
Link arm-none-eabi-(gcc/size/objcopy/gdb) to /usr/local/bin/:  
`sudo ln -s ~/st/stm32cubeclt/GNU-tools-for-STM32/bin/arm-none-eabi-gcc /usr/local/bin/arm-none-eabi-gcc`  
`sudo ln -s ~/st/stm32cubeclt/GNU-tools-for-STM32/bin/arm-none-eabi-size /usr/local/bin/arm-none-eabi-size`  
`sudo ln -s ~/st/stm32cubeclt/GNU-tools-for-STM32/bin/arm-none-eabi-objcopy /usr/local/bin/arm-none-eabi-objcopy`  
`sudo ln -s ~/st/stm32cubeclt/GNU-tools-for-STM32/bin/arm-none-eabi-gdb /usr/local/bin/arm-none-eabi-gdb`

Ensure you find arm-none-eabi-(gcc/size/objcopy/gdb) by seraching for them:  
`sudo find / -executable -name "arm-none-eabi-gcc"`  

If you get an issue related to `arm-none-eabi-gdb` has to be `>= 9`  
Download a newer version:  
`wget https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v13.2.1-1.1/xpack-arm-none-eabi-gcc-13.2.1-1.1-linux-x64.tar.gz`  
`tar xf xpack-arm-none-eabi-gcc-13.2.1-1.1-linux-x64.tar.gz`  
`rm ~/st/stm32cubeclt/GNU-tools-for-STM32/bin/arm-none-eabi-gdb*`  
`cp -rf xpack-arm-none-eabi-gcc-13.2.1-1.1/libexec ~/st/stm32cubeclt/GNU-tools-for-STM32/`  
`cp -rf xpack-arm-none-eabi-gcc-13.2.1-1.1/bin/arm-none-eabi-gdb* ~/st/stm32cubeclt/GNU-tools-for-STM32/bin/`  
