import sys
import requests
import json
import locale
def is_float(n):
    try:
        float(sys.argv[1])
        return True
    except ValueError:
        return False


if len(sys.argv) < 2:
    sys.exit("Missing command-line argument")
elif (sys.argv[1]).isnumeric() == False and is_float(sys.argv[1]) == False:
    sys.exit("Command-line argument is not a number")
else:
    number = float(sys.argv[1])
    response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
    o = response.json()

    price = o["bpi"]["USD"]["rate_float"]
    price = float(price)

    print("${:,.4f}".format(number * price))

