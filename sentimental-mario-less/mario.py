from cs50 import get_int


while True:
	n = get_int("Height: ")
	if n > 0 and n <= 8:
		break



for i in range(n):

    for j in range(n):

        if j + i < n - 1:
           print(" ", end="")
        else:
            print("#", end="")
    print("  ", end="")

    for j in range(n - 1):
        if j + i < n - 1:
           print("", end="")
        else:
            print("#", end="")

    print("#", end="")

    print()
