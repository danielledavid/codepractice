def main():
    time = input("What time is it? ")
    newtime = convert(time)
    if newtime >= 7 and newtime <= 8:
        print("breakfast time")
    elif newtime >= 12 and newtime <= 13:
        print("lunch time")
    elif newtime >= 18 and newtime <= 19:
        print("dinner time")


def convert(time):
    hours, minutes = time.split(":")
    minutes = int(minutes) / 60
    newtime = float(hours) + float(minutes)
    return newtime


if __name__ == "__main__":
    main()

"""
if newtime >= 7 and newtime <= 8:
        print("breakfast time")
    elif newtime >= 12 and newtime <= 13:
        print("lunch time")
    elif newtime >= 18 and newtime <= 19:
        print("dinner time")
"""