import random


def main():

    level = get_level()
    score = 0
    i = 0
    while i in range(10):
        x = generate_integer(level)
        y = generate_integer(level)
        z = x + y
        print (f"{x} + {y} = ", end="")
        answer = input()
        j = 0
        while j in range(2):
            if str(z) != answer:
                print("EEE")
                print (f"{x} + {y} = ", end="")
                answer = input()
                j += 1
            else:
                score += 1
                i += 1
                break
            if j == 2:
                print(f"{x} + {y} = {z}")
                i += 1
    print(f"Score: {score}")




def get_level():
    while True:
        try:
            n = input("Get Level: ")
            n = int(n)
            if n == 1:
                return n
            elif n == 2:
                return n
            elif n == 3:
                return n
            else:
                int("s")
        except ValueError:
            pass




def generate_integer(level):
    if level == 1:
        x = random.randint(0,9)
        return x
    elif level == 2:
        x = random.randint(10,99)
        return x
    elif level == 3:
        x = random.randint(100,999)
        return x
    else:
        main()



if __name__ == "__main__":
    main()