def add(a, b):
    return a + b

def divide(a, b):
    if b == 0:
        raise ValueError("не можна ділити на нуль")
    return a / b