from datetime import date
import inflect
import re
import sys
p = inflect.engine()



def main():

    print(validate(input("Date of Birth: ")))

def validate(birth):
    matches = re.search(r"^(19[0-9][0-9]|20[0-9][0-9]|2020|2021|2022|2023)-(0?[1-9]|1[012])-(0?[1-9]|2[0-9]|3[01])$", birth)
    if matches == None:
        sys.exit("Invalid date")

    else:


        year, month, day = birth.split("-")
        if int(year) > 2023 or int(year) < 1:
            sys.exit("Invalid date")
        elif int(month) > 12 or int(month) < 1:
            sys.exit("Invalid date")
        elif int(day) > 31 or int(day) < 1:
            sys.exit("Invalid date")

        today = date.today()

        newdate = date(int(year), int(month), int(day))
        new = today - newdate
        a, b, c = str(new).split(" ")
        final = int(a) * 24 * 60
        words = p.number_to_words(int(final), andword="")
        words = f"{words.capitalize()} minutes"
        return words

if __name__ == "__main__":
    main()