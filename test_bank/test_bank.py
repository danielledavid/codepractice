from bank import value



def test_hello():
    assert value("hello") == 0

def test_h():
    assert value("HI") == 20

def test_noth():
    assert value("lol") == 100
