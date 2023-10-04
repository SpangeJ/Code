# wyrdl.py
import pathlib
import random
GUESSES = 6
WORDLIST = pathlib.Path("wordlist.txt")
word = random.choice([word.upper() 
	for word in WORDLIST.read_text(encoding="utf-8").strip().split("\n")])
for i in range(1, GUESSES+1):
	guess = input(f"Guess {i}/{GUESSES}: ").upper()
	if guess == word:
		print("Correct")
		break
	print("Wrong")
	print("Correct letters:")
	c ={letter for letter, correct in zip(guess, word) if letter == correct}
	print(c) if c else print("None!")
	print("Misplaced letters:")
	m =set(word) & set(guess) - c
	print(m) if m else print("None!")
	print("Wrong letters:")
	w = set(guess) - set(word)
	print(w) if w else print("None!")

else:
	print(f"Failed! Coeect word was {word}")
