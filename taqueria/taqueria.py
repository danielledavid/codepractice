menu = {
    "Baja Taco": 4.00,
    "Burrito": 7.50,
    "Bowl": 8.50,
    "Nachos": 11.00,
    "Quesadilla": 8.50,
    "Super Burrito": 8.50,
    "Super Quesadilla": 9.50,
    "Taco": 3.00,
    "Tortilla Salad": 8.00
}
x = []
while True:
    try:
        item = input("Item: ")
        item = item.strip().title()
        x.append(menu[item])
        y = round((sum(x)), 2)
        print("Total: $", end="")
        print("%.2f" % y)
    except KeyError:
        pass
    except EOFError:
        break