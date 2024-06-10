from um import count
import pytest

def test_uppercase():
    assert count("Um") == 1

def test_question():
    assert count("um?") == 1

def test_album():
    assert count("Um, thanks for the album.") == 1

def test_umbrella():
    assert count("umbrella") == 0

def test_um():
    assert count("um") == 1