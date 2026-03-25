from math_funcs import add, divide

def test_add():
    assert add(2, 3) == 5

def test_divide():
    assert divide(10, 2) == 5.0

def test_failing():
    assert add(2, 2) == 5