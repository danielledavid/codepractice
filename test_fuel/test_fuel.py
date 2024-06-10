from fuel import convert, gauge
import pytest



def test_valid():
    assert convert("3/4") == 75

def test_letter():
    with pytest.raises(ValueError):
        convert("cat/cat")

def test_zero():
    with pytest.raises(ZeroDivisionError):
        convert("2/0")

def test_xgreater():
    with pytest.raises(ValueError):
        convert("4/1")

def test_E():
    assert gauge(1) == "E"

def test_F():
    assert gauge(99) == "F"


def test_percent():
    assert gauge(75) == "75%"