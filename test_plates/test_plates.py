from plates import is_valid

def test_length():
    assert is_valid("AAAAAAA") == False

def test_number():
    assert is_valid("AA1AAA") == False

def test_zero():
    assert is_valid("AAA012") == False

def test_valid():
    assert is_valid("AAA123") == True

def test_bumbers():
    assert is_valid("123123") == False

def test_bumberss():
    assert is_valid("A23123") == False


def test_bumbersss():
    assert is_valid("SSSS1&") == False