# an Array whose element datatype is named after an Object.prototype
# member: the cell's layout is read through the same name-indexed table
# by lay_el, which died in lay.ks.some rather than lay.ks.length. The
# array must reach the printed result: reading one element alone walks
# no layout and compiles on base
import Base

type toString is Data:
  E{v: U32}

law main.head:
  for a: Array<toString>
  U32

def main.head(a):
  match a:
    case ALeaf{item}:
      match item:
        case E{v}:
          v
    case ANode{left, right}:
      0

def main() -> Array<toString> & U32:
  ([E{4} : toString*1n], main.head([E{7} : toString*1n]))

#|([E{4}], 7)
