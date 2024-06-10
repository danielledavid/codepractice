import re
import sys


def main():
    print(count(input("Text: ")))


def count(s):
    s = s.lower()
    x = re.findall(r"\bum([,|\?|\.]|(\s)|$)", s)

    return len(x)

if __name__ == "__main__":
    main()