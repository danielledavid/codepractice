def main():
    word = input("Input: ")
    print(shorten(word))


def shorten(s):
    x = []

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


if __name__ == "__main__":
    main()