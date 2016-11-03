def cons(x, y):
    def dispather(index):
        if index == 0:
            return x
        elif index == 1:
           return y
        else:
            return 'error'

    return dispather

def car(p):
    return p(0)

import random
while True:
    print random.randint(0, 1)
