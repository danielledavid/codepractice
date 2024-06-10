from working import convert
import pytest


def test_5pm():
    assert convert("9 AM to 5 PM") == "09:00 to 17:00"

def test_5pmwithcolon():
    assert convert("9:00 AM to 5:00 PM") == "09:00 to 17:00"

def test_10pm():
    assert convert("10 PM to 8 AM") == "22:00 to 08:00"

def test_withmin():
    assert convert("10:30 PM to 8:50 AM") == "22:30 to 08:50"

def test_noTo():
    with pytest.raises(ValueError):
        assert convert("cat")


def test_invminend():
    with pytest.raises(ValueError):
        assert convert("9:60 AM to 5:60 PM")