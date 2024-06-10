from seasons import validate
import pytest

def test_valid():
    assert validate("2022-08-08") == "Five hundred twenty-seven thousand forty minutes"
