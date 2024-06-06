# README #

If I'm curious about something I might code the problem and plot the result to see how it all works. Feel free to use any of my code if it could help you by any means

## Content ##

* Arduino
  * Fridge.io is the Arduino SW to be uploaded to an Arduino controlling the temperature of each zone inside a fridge.
* docker
  * dev-container and example of using dev-container in VSCode where the development environment is a docker container.
  * init is a simple Python application.
  * swarm uses multipass to initialize a swarm cluster
* i3
  * i3 is a tiling window manager designed for X11, behold my config files
* MATLAB
  * Stock BULL and BEAR analysis
  * BODY to NED
  * Die Roll
  * An Ellipses Circumference
  * Fit To Quantile
  * Momentum of Force
  * PWM LowPass Filtering (Simulink)
  * Sure Bet
  * Zenons Paradox
* Python
  * 3D_printing generates STL files for 3D-printing from Python code. Pretty cool.
  * Challenges
    * Challenges posted at LinkedIn
  * nonlinear_equation_solver several different scripts to solve a set of nonlinear equations where you know the equations and some known x and y value pairs.
  * projectEuler are problems < 100 at https://projecteuler.net/
  * RealPython is an online source for learning Python
    * walrus, :=, is a new operator available from 3.8
    * wyrdl, was a tutorial to create the game wordl.
  * Twillio is a service to send SMS from code.
* stm32
  * f407_vscode_blinky is to make the LED flash at a STM32F407G from VSCode
  * f407_vscode_devcontainer_blinky is to make the LED flash at a STM32F407G from VSCode where the developer environment is a docker container.

### Commit style ###

At this repository, I will use an [emoji guide for your commit messages.](https://gitmoji.carloscuesta.me/)
An emoji says more than a _1000_ words

### Git Large File Storage (LFS) ###

#### Git Large File Storage (LFS) replaces large files such as audio samples, videos, datasets, and graphics with text pointers inside Git, while storing the file contents on a remote server. If Git treats the the file as a binary file you won't see your changes, then I prefer to add it to LFS ####

* .slx
* .slxc
* .mat
* .png
* .pdf
* .jpg
* .jpeg

### Gitignore ###

#### gitignore - Specifies intentionally untracked files to ignore ####

* .m~
* .asv
* /slprj/

### Code I would like to Emphasize ###

    # In GearedStockAnalysis I show that you statistically loose money if you buy BULL/BEAR product where the gearing is > 1
    # obj_3d.save("filename.stl") saves an object as a STL-file in Python, which can be imported to a slicer software and then 3d printed.

[Joachim Spange](https://www.linkedin.com/in/joachimspange/)