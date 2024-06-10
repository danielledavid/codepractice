

amount = 50

while amount > 0:
    print(f"Amount Due: {amount}")
    while True:
        n = input("Insert Coin: ")
        print(f"Amount Due: {amount}")
        if n == "25" or n == "10" or n == "5":
            n = int(n)
            break
    amount = amount - n
    print (f"Change Owed: {abs(amount)}")