expression = input("Expression: ")

x, y, z = expression.split(" ")

answer = eval(x + y + z)

print(float(answer))