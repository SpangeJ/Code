# wyrdl.py
import pathlib
import random
from string import ascii_letters
GUESSES = 6
WORD_LENGTH = 5


def get_random_word(wordlist):
	"""Get a random word from a wordlist with length
	>>> get_random_word(["a", "snake", "it'll"])
	'SNAKE'
	"""
	return random.choice([word.upper() 
		for word in wordlist
		if len(word) == WORD_LENGTH and all(letter in ascii_letters for letter in word)])

def show_guess(guess, word):
	"""Show the user's guess in the terminal and clarify all letters.

	## Example:

	>>> show_guess("CRANE", "SNAKE")
	Correct letters: A, E
	Misplaced letters: N
	Wrong letters: C, R
	"""


	c ={letter for letter, correct in zip(guess, word) if letter == correct}
	print("Correct letters:", ", ".join(sorted(c))) if c else print("No Correct letters")
	m =set(word) & set(guess) - c
	print("Misplaced letters:", ", ".join(sorted(m))) if m else print("No Misplaced letters")
	w = set(guess) - set(word)
	print("Wrong letters:", ", ".join(sorted(w))) if w else print("No Wrong letters!")


def game_over(word):
	print(f"Failed! Correct word was {word}")


def main():
	# Pre-process
	word_path = pathlib.Path(__file__).parent / "wordlist.txt"
	word = get_random_word(word_path.read_text(encoding="utf-8").split("\n"))

	# Process (main loop)
	for guess_num in range (1, GUESSES+1):
		guess = input(f"\nGuess {guess_num}: ").upper()

		show_guess(guess, word)
		if guess == word:
			break
	
	# Post-process
	else:
		game_over(word)

if __name__ == '__main__':
	main()