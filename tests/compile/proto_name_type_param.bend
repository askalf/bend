# a parametrized datatype named after an Object.prototype member: its
# name reaches the same name-indexed tables through the type argument,
# so it broke where the flat case did (lay_of -> lay.ks.length)
import Base

type __proto__<A: Data> is Data:
  W{item: A}

law main.out:
  for w: __proto__<U32>
  U32

def main.out(w):
  match w:
    case W{item}:
      item

def main() -> __proto__<U32> & U32:
  (W{9}, main.out(W{9}))

#|(W{9}, 9)
