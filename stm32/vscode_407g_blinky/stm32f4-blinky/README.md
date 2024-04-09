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
_"executable":_  to point to: _"${workspaceFolder}/build/{filename}.elf"
