import inflect
import sys


p = inflect.engine()
list = []

while True:
    try:
        x = input("Name: ")
        list.append(x)
    except EOFError:
        print(f"Adieu, adieu, to {p.join(list)}")
        sys.exit()