from pyfiglet import Figlet
import sys
from random import choice

figlet = Figlet()
list = figlet.getFonts()


if len(sys.argv) == 1:
    s = input("Input: ")
    random = choice(list)
    figlet = Figlet(font=random)
    print(figlet.renderText(s))
elif len(sys.argv) == 2:
    sys.exit("Invalid usage")


elif len(sys.argv) > 2:
    if (sys.argv[2]) not in list:
        sys.exit("Invalid usage")
    elif (sys.argv[1]) == "-font" or (sys.argv[1]) == "-f":

        s = input("Input: ")
        figlet = Figlet(font=sys.argv[2])
        print(figlet.renderText(s))
    else:
        sys.exit("Invalid usage")
