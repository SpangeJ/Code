# Zeno's Paradox #
### How many times does the Hour hand and Minute hand make a 90-degree angle during one day? ###
#### In a race, the quickest runner can never overtake the slowest since the pursuer must first reach the point whence the pursued started so that the slower must always hold a lead.
— as recounted by Aristotle, Physics VI:9, 239b15 [From Wikipedia](https://en.wikipedia.org/wiki/Zeno%27s_paradoxes) <br /> 
#### Ever wondered about that? Well you and me both
###### Of course Achilles will catch up and run past the tortoise. The real world has given us that experience. But how do we beat the reasoning? Since the tortoise has a speed and a head start, when Achilles reaches its spot the tortoise has moved even further ahead and has gained a gap to Achilles. ######
In my own mind, I have beaten that reasoning with two different thoughts.
Let us say Achilles runs at 10 m/s, the tortoise at 1m/s and it has a 9m head start.

Debunk #1:<br />
If viewed from the tortoises perspective moving the view along with the tortoise it is standing still. Then it looks like Achilles is running 9 m/s. Hence it takes 1s before Achilles passes the tortoise.

Debunk #2:<br />
It takes Achilles &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.9s to run the &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 9m. Then the tortoise has moved &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.9m.<br />
It takes Achilles &nbsp; &nbsp; &nbsp; &nbsp; 0.09s to run the &nbsp; &nbsp; &nbsp; &nbsp; 0.9m. Then the tortoise has moved &nbsp; &nbsp; &nbsp; &nbsp; 0.09m.<br />
It takes Achilles &nbsp; &nbsp; &nbsp; 0.009s to run the &nbsp; &nbsp; &nbsp; 0.09m. Then the tortoise has moved &nbsp; &nbsp; &nbsp; 0.009m.<br />
It takes Achilles &nbsp; &nbsp; 0.0009s to run the &nbsp; &nbsp; 0.009m. Then the tortoise has moved &nbsp; &nbsp; 0.0009m.<br />
It takes Achilles &nbsp; 0.00009s to run the &nbsp; 0.0009m. Then the tortoise has moved &nbsp; 0.00009m.<br />
It takes Achilles 0.000009s to run the 0.00009m. Then the tortoise has moved 0.000009m.<br />
Do you see where I am going? The time between each step is divided by 10. And the sum is finite. It is 1s as with the example above. This is a converging geometric series.

And then one day I was asked the question:
"How many times does the Hour hand and Minute hand make a 90-degree angle during one day?"
My thoughts were drawn to Zeno's Paradox immediately!
If the time is, e.g. 15:00 they make a 90-degree angle. The next time would be 15:30 since the Minute Hand has moved 180 degrees, but wait! The Hour Hand has also moved! A bit. It has also moved for 30 minutes. So it is not 30 minutes it is something more! Zeno's Paradox all over again.

So for fun, I sat down and made a script with a 100 iteration for loop and simulated the Achilles and tortoise from Debunk #2 above. It turns out in the discrete world of MATLAB and computes the time reaches 0 before i = 100.

Enjoy!

[Joachim Spange](https://www.linkedin.com/in/joachimspange/)