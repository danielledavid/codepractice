x = input("File name: ")
y = x.strip().lower()


if y.endswith(".jpeg") == True or y.endswith(".jpg") == True:
    print("image/jpeg")
elif y.endswith(".gif") == True:
    print("image/gif")
elif y.endswith(".png") == True:
    print("image/png")
elif y.endswith(".pdf") == True:
    print("application/pdf")
elif y.endswith(".txt") == True:
    print("text/plain")
elif y.endswith(".zip") == True:
    print("application/zip")
else:
    print("application/octet-stream")