from cs50 import get_float
import math
while True:
    get_cents = get_float("Change owed: ") * 100
    if get_cents >= 0:
        break
calculate_quarters = get_cents / 25
calculate_dimes = (get_cents - (math.floor(calculate_quarters) * 25)) / 10
calculate_nickels = (get_cents - ((math.floor(calculate_quarters) * 25)) - (math.floor(calculate_dimes) * 10)) / 5
calculate_pennies = get_cents - (math.floor(calculate_quarters) * 25) - (math.floor(calculate_dimes) * 10) - (math.floor(calculate_nickels) * 5)
total = int(math.floor(calculate_quarters) + math.floor(calculate_dimes) + math.floor(calculate_nickels) + calculate_pennies)
print(f"{total}")