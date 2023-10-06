# wyrdl.py
import pathlib
import random
from string import ascii_letters
from rich.console import Console
from rich.theme import Theme
GUESSES = 6
WORD_LENGTH = 5
console = Console(width=40, theme=Theme({"warning": "red on yellow"}))


def get_random_word(wordlist):
	"""Get a random word from a wordlist with length
	>>> get_random_word(["a", "snake", "it'll"])
	'SNAKE'
	"""
	return random.choice([word.upper() 
		for word in wordlist
		if len(word) == WORD_LENGTH and all(letter in ascii_letters for letter in word)])

def show_guesses(guesses, word):
	for guess in guesses:
		styled_guess = []
		for letter, correct in zip(guess, word):
			if letter == correct:
				style = "bold white on green"
			elif letter in word:
				style = "bold white on yellow"
			elif letter in ascii_letters:
				style = "bold white on #666666"
			else:
				style = "dim"
			styled_guess.append(f"[{style}]{letter}[/]")
		console.print("".join(styled_guess), justify="center")


def refresh_page(headline):
	console.clear()
	console.rule(f"[bold blue]:leafy_green: {headline} :leafy_green:[/]\n")


def game_over(guesses, word, guessed_corectly):
	refresh_page(headline=f"Game Over")
	show_guesses(guesses, word)
	if guessed_corectly:
		console.print(f"\n[bold on white green]Correct, the word is {word}[/]")
	else:
		console.print(f"[bold white on red]Sorry, the word was {word}[/]")


def main():
	# Pre-process
	word_path = pathlib.Path(__file__).parent / "wordlist.txt"
	word = get_random_word(word_path.read_text(encoding="utf-8").split("\n"))
	guesses = ["_" * WORD_LENGTH] * GUESSES

	# Process (main loop)
	for idx in range (GUESSES):
		refresh_page(headline=f"Guess {idx + 1}")
		show_guesses(guesses, word)
		guesses[idx] = input(f"\nGuess word: ").upper()
		if guesses[idx] == word:
			break
	
	# Post-process
	game_over(guesses, word, guessed_corectly=guesses[idx] == word)


if __name__ == '__main__':
	main()