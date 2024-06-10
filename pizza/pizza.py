import sys
import os.path
import csv
from tabulate import tabulate

if len(sys.argv) < 2:
    sys.exit("Too few command-line arguments")
if len(sys.argv) > 2:
    sys.exit("Too many command-line arguments")
elif (sys.argv[1]).endswith(".csv") == False:
    sys.exit("Not a CSV file")
elif os.path.exists(sys.argv[1]) == False:
    sys.exit("File does not exist")

else:
    with open(sys.argv[1]) as file:
        reader = csv.reader(file)
        print(tabulate(reader, headers="firstrow", tablefmt="grid"))