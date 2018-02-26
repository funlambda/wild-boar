type t = float * float

let make x y = (x,y)

let zero = (0., 0.)
let add ((x1, y1)) ((x2, y2)) = (x1 +. x2, y1 +. y2)
let scale scalar ((x, y)) = (scalar *. x, scalar *. y)
let norm ((x, y)) = sqrt ((x ** 2.) +. (y ** 2.))

let (%+) a b = add a b
let (%*) t v = scale t v
let (%-) a b = add a (scale (-1.) b)
