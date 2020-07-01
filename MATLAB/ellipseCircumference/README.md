# The circumference of an Ellipse #
#### How hard can it be, right? I allays thought that instead of the radius one just uses the average of the semi-minor and semi-major axis. I.E. O=pi(a+b). I was so wrong ... #####
##### So here is a script that computes the circumference. #####
There are many equations to finding the circumference, but one thing MATLAB is good at is to sum up the value of series. So I found an [exact formula](https://www.mathsisfun.com/geometry/ellipse-perimeter.html), which converges fast an implemented it. Summing 1000 elements are close enough to the exact solution. 

This Equation combines the Binomial Coefficient with half-integer factorials. If that doesn't give you water in your mouth, then I don't know what does.

[Joachim Spange](https://www.linkedin.com/in/joachimspange/)