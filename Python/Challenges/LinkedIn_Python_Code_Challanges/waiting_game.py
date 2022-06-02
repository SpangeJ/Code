#!/urs/bin/python
from random import randint as rd
from arrow import utcnow
wait = rd(2,4)
print(f"your goal is to wait {wait}s")
input("Hit [Enter]")
start = utcnow().float_timestamp
input("Hit [Enter]")
end = utcnow().float_timestamp

diff = end - start - wait
if abs(diff) < 0.1:
    print("Wow! Spot on! Less than .1s deviation")
    print(f"You were {int(diff*1000)}ms off")
elif diff < 0:
    print(f"you were {abs(diff):.2f}s too fast!")
elif diff > 0:
    print(f"you were {diff:.2f}s too slow")