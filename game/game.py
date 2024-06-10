import random


while True:
    try:
        n = input("Level: ")
        n = int(n)
        if n < 1:
            pass
        else:
            break
    except ValueError:
        pass

n = random.randint(1, n)

while True:
    try:
        guess = input("Guess: ")
        guess = int(guess)
        if guess > n:
            print("Too large!")
            pass
        elif guess < n:
            print("Too small!")
            pass
        else:
            print("Just right!")
            break
    except ValueError:
        pass