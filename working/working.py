import re
import sys


def main():
    print(convert(input("Hours: ")))


def convert(s):


    start, end = s.split(" to ")
    start1, start2 = start.split(" ")
    end1, end2 = end.split(" ")
    if matches := re.search(r"^(.+):(.+)$", start1):
        start1 = matches.group(1)
        minstart = matches.group(2)
        if int(minstart) > 59:
            raise ValueError
        if int(start1) > 23:
            raise ValueError
    else:
        minstart = "00"
    if matches := re.search(r"^(.+):(.+)$", end1):
        end1 = matches.group(1)
        minend = matches.group(2)
        if int(minend) > 59:
            raise ValueError
        if int(end1) > 23:
            raise ValueError
    else:
        minend = "00"
    if re.search(r"PM", start2) and int(start1) < 12:
        start1 = 12 + int(start1)

    if re.search(r"PM", end2) and int(end1) < 12:
        end1 = 12 + int(end1)


    if len(str(start1)) == 1:
        start1 = "0" + str(start1)

    if len(str(end1)) == 1:
        end1 = "0" + str(end1)

    if re.search(r"AM", start2) and int(start1) == 12:
        start1 = "00"

    if re.search(r"AM", end2) and int(end1) == 12:
        end1 = "00"


    x = str(start1) + ":" + minstart + " to " + str(end1) + ":" + minend
    return x

if __name__ == "__main__":
    main()