# I am the := Goo goo g'joob

import pathlib
import sys
import time
import parse
from reader import feed
import statistics


## Example 1: I/O
# 1.1
for filename in sys.argv[1:]:
    path = pathlib.Path(filename)
    counts = (
        path.read_text().count("\n"),
        len(path.read_text().split()),
        len(path.read_text()),  # TODO: path.read_text() is run twice
    )
    print(*counts, path)

# 1.2
for filename in sys.argv[1:]:
    path = pathlib.Path(filename)
    text = path.read_text()  # TODO: fixes issue abobe, ok solution
    counts = (
        text.count("\n"),
        len(text.split()),
        len(text),
    )
    print(*counts, path)

# 1.3 - Walrus
for filename in sys.argv[1:]:
    path = pathlib.Path(filename)
    counts = (
        (text := path.read_text()).count("\n"),  # More neat solution using walrus
        len(text.split()),
        len(text),
    )
    print(*counts, path)


## Example 2: Comprehensions
# 2.1
def slow(num):
    time.sleep(1)
    return num


numbers = [7, 6, 1, 4, 1, 8, 0, 6]
results = [
    slow(num) for num in numbers if slow(num) > 0
]  # TODO: aiai, not good to call slow() twice

# 2.2 - double comprehension, fixes twice slow() call
results = [
    value for num in numbers for value in [slow(num)]
    if value > 0
]

# 2.3 - for loop also fixes issue, but the readability ...
results = []
for num in numbers:
    value = slow(num)
    if value > 0:
        results.append(value)

# 2.4 - walrus
results = [value for num in numbers if (value := slow(num)) > 0] # One slow() call
#NB! Note := in if not start of comprehension
# This will crash:
# results = [(value := slow(num)) for num in numbers if value > 0]

## Example 3: pasring
# 3.1
pattern = parse.compile(
    "The Real Python Podcast – Episode #{num:d}: {name}"
)

podcasts = [
    pattern.parse(title)["name"]
    for title in feed.get_titles()
    if pattern.parse(title) #TODO: parse is called twice
]

print(podcasts[:3])

#3.2 - walrus
podcasts = [
    podcast["name"]
    for title in feed.get_titles()
    if (podcast := pattern.parse(title))
]

print(podcasts[:3])

#3.3 - even more walrus
long_average = statistics.mean(
    title_length
    for title in podcasts
    if (title_length := len(title)) > 50
)

print(long_average)

## Example 4: While loops
#4.1
question = "Will you use the walrus operator?"
valid_answers = {"yes", "Yes", "y", "Y", "no", "No", "n", "N"}

user_answer = input(f"\n{question} ")
while user_answer not in valid_answers:
    print(f"Please answer one of {' '.join(valid_answers)}")
    user_answer = input(f"\n{question} ") #TODO: double usage of input()

#4.2 - Do you really wanna do a while True??
while True:
    user_answer = input(f"\n{question} ")
    if user_answer in valid_answers:
        break
    print(f"Please answer one of {' '.join(valid_answers)}")

#4.3 - walrus
while (user_answer := input(f"\n{question} ")) not in valid_answers:
    print(f"Please answer one of {' '.join(valid_answers)}")
