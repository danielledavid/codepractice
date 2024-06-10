import string

def main():
    plate = input("Plate: ")


    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")


def is_valid(s):
    d=[]
    for c in s:
        if c.isnumeric() == True:
            d.append(c)
        elif any(char in string.punctuation for char in s):
            return False

    if len(s) > 6 or len(s) < 2:
        return False
    elif s[0].isalpha() == False or s[1].isalpha() == False:
        return False
    elif len(s) == 4:
        if s[2].isnumeric() == True and s[3].isalpha() == True:
            return False
        else:
            if int(d[0]) == 0:
                return False
            return True
    elif len(s) == 5:
        if s[2].isnumeric() == True and (s[3].isalpha() == True or s[4].isalpha() == True):
            return False
        elif s [3].isnumeric() == True and s[4].isalpha() == True:
            return False
        else:
            if int(d[0]) == 0:
                return False
            return True
    elif len(s) == 6:
        if s[2].isnumeric() == True and (s[3].isalpha() == True or s[4].isalpha() == True or s[5].isalpha() == True):
            return False
        elif s[3].isnumeric() == True and (s[4].isalpha() == True or s[5].isalpha() == True):
            return False
        elif s[4].isnumeric() == True and s[5].isalpha() == True:
            return False
        else:
            if s.isalpha() == False:
                if int(d[0]) == 0:
                    return False
            return True
    elif s.isalpha() == False:
        if int(d[0]) == 0:
            return False
    else:
        return True


main()