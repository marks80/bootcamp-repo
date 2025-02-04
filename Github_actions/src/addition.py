#testing
def add(a, b):
  return a + b

def test_add():
  assert add(2, 2) == 4
  assert add(1, -1) == 0
