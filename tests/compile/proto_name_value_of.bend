# the Object.prototype members the issue does not name reach the same
# name-indexed tables: valueOf and hasOwnProperty inherit FUNCTIONS and
# propertyIsEnumerable one more, so the lookup is never undefined for
# them either. One nesting per name, so a table that answered only the
# three reported names would still die here
import Base

type valueOf is Data:
  V{n: U32}

type hasOwnProperty is Data:
  H{v: valueOf}

type propertyIsEnumerable is Data:
  Q{h: hasOwnProperty, m: U32}

law main.out:
  for q: propertyIsEnumerable
  U32

def main.out(q):
  match q:
    case Q{h, m}:
      match h:
        case H{v}:
          match v:
            case V{n}:
              (n + m : U32)

def main() -> propertyIsEnumerable & U32:
  (Q{H{V{20}}, 22}, main.out(Q{H{V{20}}, 22}))

#|(Q{H{V{20}}, 22}, 42)
