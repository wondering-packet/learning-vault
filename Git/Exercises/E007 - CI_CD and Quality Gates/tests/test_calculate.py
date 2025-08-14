from apps.calculator_private import add, divide, multiply, subtract


def test_add():
    assert add(3, 3) == 6
    assert add(-1, 1) == 0
    assert add(0, 0) == 0
    assert multiply(2, 3) == 6
    assert divide(10, 5) == 2
    assert subtract(15, 5) == 10
