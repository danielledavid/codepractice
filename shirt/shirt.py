import sys
import os
from PIL import Image, ImageOps


if len(sys.argv) < 3:
    sys.exit("Too few command-line arguments")
if len(sys.argv) > 3:
    sys.exit("Too many command-line arguments")
elif (sys.argv[1]).endswith(".png") and (sys.argv[2]).endswith(".png") == False:
    sys.exit("Input and output have different extensions")
elif (sys.argv[1]).endswith(".jpg") and (sys.argv[2]).endswith(".jpg") == False:
    sys.exit("Input and output have different extensions")
elif os.path.exists(sys.argv[1]) == False:
    sys.exit("Input does not exist")

else:
    shirt = Image.open(sys.argv[1])
    shirt1 = Image.open("shirt.png")
    size = shirt1.size


    with Image.open(sys.argv[1]) as im:
        new = ImageOps.fit(im, size, method=Image.BICUBIC, bleed=0.0, centering=(0.5, 0.5))
        new.paste(shirt1, shirt1)
        new.save(sys.argv[2])