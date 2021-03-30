a = 1
b = 2
theSum = 0
while True:
	if a%2==0:
		theSum += a
	if b > 4_000_000:
		break
	b = a+b
	a = b-a
print(theSum)