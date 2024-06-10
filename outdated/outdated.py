months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]

while True:
    try:
        date = input("Date: ")
        if len(date) > 10:
            month, day, year = date.split(" ")
            if day[-1] != ",":
                int(month)
            day = int(day.rstrip(","))
            year = int(year)
            month = month.title()
            if month not in months:
                int(month)
            elif day > 31 or day <= 0:
                int(month)
            elif year < 0:
                int(month)
            index = months.index(month) + 1
            print (f"{year}-{index:02}-{day:02}")
            break
        else:
            month, day, year = date.split("/")
            day = int(day)
            year= int(year)
            month = int(month)
            if month <= 0 or month > 12:
                int("lol")
            elif day > 31 or day <= 0:
                int("lol")
            elif year < 0:
                int("lol")
            print(f"{year}-{month:02}-{day:02}")
            break
    except ValueError:
        pass
