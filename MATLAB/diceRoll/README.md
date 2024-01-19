# Dice Roll probability #
##### Say you are playing a game where you have several dice to toss. For some reason, a specific die has to be NOT strictly higher than all the others. #####
###### So, I was playing the board game [Energy Empire](https://boardgamegeek.com/boardgame/176734/manhattan-project-energy-empire). My friend Jon had gone for one nuclear power rector and several environment-friendly sources of power. At the end of a round, a power source is represented by a die, and you roll them all, determining if you have nuclear fallout. If it is a tie between dice you choose. Rolling 4 green dice and 1 yellow die Jon had pretty good odds. But of course, that damn yellow dice was higher than all the other dice. Darn! What's the probability that this unlikely event would occur? Ever wondered about that? Well you and me both! ######

So first I created _die1NotHighest.m_ where I simulate 1e10 number of 2-6 dice rolls. And logged if the first die was strictly higher than all the others. So my friend Jon, which rolled 5 dice, managed to get the undesired result at the probability of 12.59%.

But then the real magic started. The next day I sat down and did the math. I calculated the probability as a probabilistic expression (which is a lot easier when you know the result). And the result, WOW! The most beautiful mathematical expression I have ever seen. Behold:

![](Images/general.png "The most beautiful mathemathical expression I have ever created")

This is the general expression of rolling N, S-sided dice (NdS) looks like this. In the example with my friend Jon rolling 5d6, it becomes:

![](Images/example.png "Example")

[Here](markdown/table.md) is a lookup table for 2-20 sided dice when you are rolling 2-25 dice (numbers in %).

[Joachim Spange](https://www.linkedin.com/in/joachimspange/)
