import sys
import csv
import os

if len(sys.argv) < 3:
    sys.exit("Too few command-line arguments")
if len(sys.argv) > 3:
    sys.exit("Too many command-line arguments")
elif (sys.argv[1]).endswith(".csv") == False:
    sys.exit("Not a CSV file")
elif os.path.exists(sys.argv[1]) == False:
    sys.exit(f"Could not read {sys.argv[1]}")

else:

    students = []


    with open(sys.argv[1], "r") as file:
        reader = csv.DictReader(file)
        with open(sys.argv[2], "w") as file:
                writer = csv.DictWriter(file, fieldnames=["first", "last", "house"])
                writer.writeheader()
        for row in reader:
            last, first = row["name"].split(", ")
            home = row["house"]
            students.append({"name": last, "home": home})
            with open(sys.argv[2], "a") as file:
                writer = csv.DictWriter(file, fieldnames=["first", "last", "house"])
                writer.writerow({"first":first, "last":last, "house":home})



