# (control) a CONSTRUCTOR and a FIELD named after an Object.prototype
# member compile on base too: only a DATATYPE's name indexes WORDS and
# the printed-kind table, and a constructor's own emitted key is already
# a computed property. This pins the fix's scope -- it must not need to
# change, and must not break, the constructor and field name paths
import Base

type Box is Data:
  __proto__{toString: U32}

law main.out:
  for b: Box
  U32

def main.out(b):
  match b:
    case __proto__{toString}:
      toString

def main() -> Box & U32:
  (__proto__{5}, main.out(__proto__{5}))

#|(__proto__{5}, 5)
