# Getting started

The build folder is ignored in this repo (see _.gitignore_)

Do:  
_mkdir build_  
_cd build_  
_cmake .._  
_cmake --build ._  

## Edit launch.json

Open _launch.json_  
Edit:  
_"executable":_  to point to: _"${workspaceFolder}/build/${workspaceFolderBasename}.elf"

## SVD-file

download [STM32F407.svd](https://github.com/reportingsjr/stm32f407x/blob/master/STM32F407.svd) and add it to the __debug-files__ folder