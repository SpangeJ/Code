from tabulate import tabulate

N = 25
S = 20

Table = [[0] * S for _ in range(N - 1)]

# Adjusting row indices (2-20) for the table
headers = ['D\S'] + list(range(2, S+1))

for n in range(2, N+1):
    row = [n]
    for s in range(2, S+1):
        sum_val = 0
        for z in range(1, s):
            sum_val += z**(n-1)
        row.append(round(sum_val / s**n * 100, 2))
    Table[n-2] = row

# Converting the table to markdown format
table_markdown = tabulate(Table, headers, tablefmt='github')

# Save the table_markdown to table.md
with open('table.md', 'w') as file:
    file.write(table_markdown)
