from tabulate import tabulate

N = 20
S = 20

Table = [[0] * N for _ in range(S)]

for n in range(2, N+1):
    for s in range(2, S+1):
        sum_val = 0
        for z in range(1, s):
            sum_val += z**(n-1)
        Table[n-2][s-2] = sum_val / s**n

# Adding row indices (2-20) to the table
headers = [''] + list(range(2, N+1))

# Converting the table to markdown format
table_markdown = tabulate(Table, headers, tablefmt='github')

# Save the table_markdown to table.md
with open('table.md', 'w') as file:
    file.write(table_markdown)