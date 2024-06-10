import sys



if len(sys.argv) < 2:
    sys.exit("Too few command-line arguments")
if len(sys.argv) > 2:
    sys.exit("Too many command-line arguments")
elif (sys.argv[1]).endswith(".py") == False:
    sys.exit("Not a Python file")

else:
    count = 0
    with open(sys.argv[1]) as file:
        for line in file:
            if line != "\n" and line.strip().startswith("#") == False and len(line.strip()) >= 1:
                count += 1
    print(count)

