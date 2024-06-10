
from twttr import shorten


def test_lowercase():
    assert shorten("hilol") == "hll"

def test_uppercase():
    assert shorten("HILOL") == "HLL"

def test_punctuation():
    assert shorten("HILOL,") == "HLL,"

def test_numbers():
    assert shorten("HILOL1") == "HLL1"