# mls
A collection of programs to grind on Stats.

2020East.swft
=
An anlysis of the Eastern Division of "The MLS is Back" Tournament.

This program uses the monte carlo method to determin the probabilties that a team will advance to the group of 16 in the easter division.  The western division is relatively simple with a ~66% chance.

This program has the following known, but relatively unimportant deficits.
-
1. Within each group the earlier team in the group when tied will advance
2. When wildcards are tied the first wildcard will go lower team

The results
-
>["56%", "55%", "55%", "55%", "54%", "55%", "61%", "59%", "56%", "55%", "61%", "59%", "56%", "55%"]
>Third place goes to Group A 82% of the time
>Third place goes to Group B 9% of the time
>Third place goes to Group C 8% of the time
>
>Fourth place goes to Group A 63% of the time
>Fourth place goes to Group B 18% of the time
>Fourth place goes to Group C 18% of the time

- Group A has a 55% chance of advancing to the group of 16
- Group B and C have a 58% chance of advancing.

There is 3% penalty for being in group A as opposed to the 10% penalty for just being in the East.
