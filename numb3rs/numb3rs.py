import re
import sys


def main():
    print(validate(input("IPv4 Address: ")))


def validate(ip):
    try:
        a, b, c, d = ip.split(".")
        if re.search(r"^[2][0-5][0-5]$|^[0-9]$|^[2][0-4][0-9]$|^[1][0-9][0-9]$|^[1-9][0-9]$", a) and re.search(r"^[2][0-5][0-5]$|^[0-9]$|^[2][0-4][0-9]$|^[1][0-9][0-9]$|^[1-9][0-9]$", b) and re.search(r"^[2][0-5][0-5]$|^[0-9]$|^[2][0-4][0-9]$|^[1][0-9][0-9]$|^[1-9][0-9]$", c) and re.search(r"^[2][0-5][0-5]$|^[0-9]$|^[2][0-4][0-9]$|^[1][0-9][0-9]$|^[1-9][0-9]$", d):
            return True
        else:
            return False
    except ValueError:
        return False

if __name__ == "__main__":
    main()