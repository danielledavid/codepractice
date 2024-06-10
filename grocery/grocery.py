lists = {}

i = 1



while True:
    try:
        x = input()
        x = x.strip().lower()
        if x in lists:
            lists[x] = (i + 1)
        else:
            lists[x] = i
    except KeyError:
        print(f"{lists}")
        break
    except EOFError:

        for list in sorted(lists):
            print(lists[list], end=" ")
            print(list.upper())
        break
