import collections

def reverse(L):
    return L[::-1]

def deep_reverse(L):
    if not isinstance(L, collections.Iterable):
        return L
    else:
        return reverse(map(deep_reverse, L))


# get subsets

def subsets(L):
    if len(L) == 0:
        return [[]]
    else:
        rest = subsets(L[1:])
        return rest + map(lambda x: x + [L[0]], rest)


def fib(x):
    if x <=1:
        return x
    else:
        return fib(x-1) + fib(x-2)
