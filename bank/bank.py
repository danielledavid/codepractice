x = input("Greeting: ")
y = x.strip().lower()

if y.startswith("hello") == True:
    print("$0")
elif y.startswith("h") == True:
    print("$20")
else:
    print("$100")