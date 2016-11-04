import collections

def reverse(L):
    return L[::-1]

def deep_reverse(L):
    if not isinstance(L, collections.Iterable):
        return L
    else:
        return reverse(map(deep_reverse, L))
