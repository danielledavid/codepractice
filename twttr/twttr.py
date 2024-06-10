




def main():
    shorten()


def shorten():

    x = []
    s = input("Input: ")
    for c in s:
        if c.lower() == "a" or c.lower() == "e" or c.lower() == "i" or c.lower() == "o" or c.lower() == "u":
            y = ""
            x.append(y)
        else:
            x.append(c)
    string = ""
    for f in x:
        string += f
    return string


main()