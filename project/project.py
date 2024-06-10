import sys



def main():
    height = get_height()
    weight = get_weight()

def get_height():
    while True:
        try:
            n = input("Height (in meters): ")
            n = int(n)
            if n > 0:
                return n
            else:
                int("s")
        except ValueError:
            sys.exit("Invalid height")


def get_weight():
    while True:
        try:
            n = input("Weight (in kg): ")
            n = int(n)
            if n > 0:
                return n
            else:
                int("s")
        except ValueError:
            sys.exit("Invalid weight")



def function_n():
    ...


if __name__ == "__main__":
    main()