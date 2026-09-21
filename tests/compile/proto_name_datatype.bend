# a datatype named after an Object.prototype member is an ordinary
# datatype: the compiler's name-indexed tables must not answer an
# inherited member for it. WORDS gave __proto__ the prototype object
# instead of undefined, so lay_of returned a non-Lay and both emitters
# died in lay.ks.length; the printed-kind table gave toString a
# function, which left the emitted show descriptor holding no cells
import Base

type __proto__ is Data:
  P{v: U32}

type constructor is Data:
  C{p: __proto__}

type toString is Data:
  T{c: constructor, w: U32}

law main.wrap:
  for n: U32
  toString

def main.wrap(n):
  T{C{P{n}}, 7}

law main.out:
  for t: toString
  U32

def main.out(t):
  match t:
    case T{c, w}:
      match c:
        case C{p}:
          match p:
            case P{v}:
              (v + w : U32)

def main() -> toString & U32:
  (main.wrap(35), main.out(main.wrap(35)))

#|(T{C{P{35}}, 7}, 42)
