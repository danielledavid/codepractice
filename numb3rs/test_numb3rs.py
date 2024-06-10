from numb3rs import validate

def test_zero():
    assert validate("1.0.1.1") == True

def test_more():
    assert validate("1.256.1.1") == False

def test_moredots():
    assert validate("1.1.1.1.1") == False

def test_lessdots():
    assert validate("1.1.1") == False

def test_cat():
    assert validate("cat") == False