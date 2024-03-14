# Blink orange LED on STM32F407G-DISC1

This code connects to a STM32F407G-DISC1 developer board.  
This folder is opened in the STM32CubeIDE, buildt and run from there.  
Upon succesfull upload the orange LED will flash on/off every 1s.  
The project is initilized from the IDE as a STM32F407G-DISC1 project. The only edit done is to add the following lines to Core/Src/main.c:  
`HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_13);`  
`HAL_Delay(1000);`

Inside the `while (1)` loop

**How to reproduce:**  
Install the TM32CubeIDE at ~/st/:  
https://www.st.com/en/development-tools/stm32cubeide.html

**Toubleshooting:**  
If you get an issue related to `arm-none-eabi-gdb`  
Download a newer version:  
`cd Downloads`  
`wget https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases/download/v13.2.1-1.1/xpack-arm-none-eabi-gcc-13.2.1-1.1-linux-x64.tar.gz`  
`tar xf xpack-arm-none-eabi-gcc-13.2.1-1.1-linux-x64.tar.gz`  
`rm ~/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.11.3.rel1.linux64_1.1.100.202309141235/tools/bin/arm-none-eabi-gdb*`  
`cp -rf xpack-arm-none-eabi-gcc-13.2.1-1.1/libexec ~/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.11.3.rel1.linux64_1.1.100.202309141235/tools/`  
`cp -rf xpack-arm-none-eabi-gcc-13.2.1-1.1/bin/arm-none-eabi-gdb* ~/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32.11.3.rel1.linux64_1.1.100.202309141235/tools/bin/`  
