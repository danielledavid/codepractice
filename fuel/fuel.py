def main():
    x = get_int()
    if x >= 99:
        print("F")
    elif x <= 1:
        print("E")
    else:
        print(f"{x}%")


def get_int():
    while True:
        try:
            inputs = input("Fraction: ")
            x, y = inputs.split(sep="/")
            z = int(round(((int(x) / int(y)) * 100), 0))
            if int(x) > int(y):
                pass 
            else:
                return z
        except ValueError:
            pass
        except ZeroDivisionError:
            pass

main()