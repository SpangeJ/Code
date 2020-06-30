# PWM Low Pass Filter #
#### Have you found out that the [AnalogWrite](https://www.arduino.cc/reference/en/language/functions/analog-io/analogwrite/) function of an Arduino does not send a flat analog signal, but rather a fast oscillating square wave? If you are forced to use a flattened signal how do you do that? Ever wondered about that? Well you and me both! ####
PWM, Pulse Width Modulation, is a common signal type used among micro-controllers. The signal has a high frequency and can be either HIGH or LOW. With an Arduino and many other micro-controllers HIGH means 5 Volt. The idea is to adjust the amount the signal is high (0-100%) pr. cycle to achieve the desired voltage. This is called the duty cycle. E.G. if you want 2.5V the 5V signal is 50% HIGH and 50% LOW pr. cycle. For an Arduino UNO, the frequency is either 490Hz or 980Hz, so it is a fast signal. Most components, e.g. a LED, would not flicker at 490Hz between max light and no light but rather settle at the average light intensity of one cycle. Think of it as the component has inertia (resistors and capacitors) and won't be able to keep up with the fast-shifting PWM signal.

But What if you really needed to smooth out the signal? Well here are thee solutions:
1) But a [Arduino DUE](https://store.arduino.cc/arduino-due)
2) But any DAC, Digital to Analog Converter, and start soldering
3) Create your own Low Pass filter to smooth out the signal.

Guess what I did?
Yes, number three.

In practice, it is easier than you might think to flatten out a PWM signal. You need one resistor and one capacitor. This makes a [RC circuit](https://en.wikipedia.org/wiki/RC_circuit). Here is my result:
![](Images/RC-Circuit.JPG "My RC circuit to Low Pass filter a PWM Signal")

But the theory behind choosing good values for the resistor, R, and the capacitor, C, is not that easy. You could of course go crazy by testing R and C values. That is what I first did. I had 5 resistors and 5 capacitors. That's 25 combinations, and none of them worked. 

So I dug into the theory, and it resulted in a differential equation.
Simulink is ideal for simulation differentiation equations over time.
After some quick testing, I ended up with a 10k Resistor and a 100uF Capacitor.

In my models, you can play around with R and C values, also the frequency of the PWM signal and the value of HIGH.
Enjoy!

[Joachim Spange](https://www.linkedin.com/in/joachimspange/)