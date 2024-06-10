from cs50 import get_string

text = get_string("Text: ")
sentences = text.count('.') + text.count('?') + text.count('!')
letters = len(text) - sentences - text.count(' ') - text.count("'") - text.count('"') - 1
word = text.count(' ') + 1
L = letters / word * 100
S = sentences / word * 100
grade = 0.0588 * L - 0.296 * S - 15.8
if grade >= 16:
    print(f"Grade 16+")
elif grade < 1:
    print(f"Before Grade 1")
elif grade < 16 and grade > 1:
    print(f"Grade {round(grade)}")