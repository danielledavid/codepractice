def main():
    x = input ("What's x?")

    y = input("What's y?")
    fraction = x + "/" + y
    percentage = convert(fraction)
    print(gauge(percentage))


def convert(fraction):
    x, y = fraction.split(sep="/")
    x = int(x)
    y = int(y)

    z = (x / y) * 100
    if x > y:
        int("s")
    return z

def gauge(percentage):
    if percentage <= 1:
        return "E"
    elif percentage >= 99:
        return "F"
    else:
        z = int(percentage)
        return str(z) + "%"

if __name__ == "__main__":
    main()