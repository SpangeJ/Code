# Fit distribution to Quantiles #
#### In this script I try to fit a Normal or Skewed Normal distribution to two variables. The mean and a quantile.  #####
##### Every year my union, TEKNA, publishes statistics of the salary of its members. It is presented as a table containing mean, median, lower quantile (25%), and higher quantile (75%). That got me thinking. A normal distribution is a function of two parameters; mean; variance. Is it possible to construct a normal distribution when two or more values are known? Ever wondered about that? Well you and me both! #####

So what I did was this:
I implemented the theory of the [Normal Distribution](https://en.wikipedia.org/wiki/Normal_distribution). Then I declared an initial condition where I guessed a variance, then I computed the Cumulative Density Function (CDF) at 25% (Q25) and compared the result with the table. If it was to low the variance had to be smaller, and vice versa. And after some iterations, I found a solution!
Of course, it hits the mean and Q25 spot on, but it misses on the Q75 values. Of course, you could fit it to the Q75, but then it misses on Q25. (Maybe do an average?)
This tells me that the distribution is not a perfect Normal Distribution.

Then I implemented the theory of the [Skew Normal Distribution](https://en.wikipedia.org/wiki/Skew_normal_distribution). 
Here I cheated a little bit and found the [T-function of Owen](https://people.sc.fsu.edu/~jburkardt/m_src/asa005/tfn.m), thanks to John Burkardt. And did the same exercise.

I hope you are able to use these scripts to fit a Normal Distribution or a Skew Normal Distribution to your dataset containing mean and quantile.

Enjoy!

![](Images/Quantile_of_a_Distribution.png "Quantiles")

[Joachim Spange](https://www.linkedin.com/in/joachimspange/)