from math import inf
M = [[131, 673, 234, 103, 18],[201, 96, 342, 965, 150], [630, 803, 746, 422, 111],[537, 699, 497, 121, 956],[805, 732, 534, 37, 331]]
M = []
with open('p081_matrix.txt','r') as file:
	for line in file:
		M.append(line.split(','))
n = len(M)
for i in range(n):
	for j in range(n):
		M[i][j] = int(M[i][j].strip())		
#import pdb; pdb.set_trace()
for i in range(n):
	for j in range(n):
		if i == 0 and j == 0:
			continue
		if i > 0: 
			above = M[i-1][j]
		else:
			above = inf
		if j > 0:
			left = M[i][j-1]
		else:
			left = inf
		M[i][j] += min(above, left)

print(M[n-1][n-1])