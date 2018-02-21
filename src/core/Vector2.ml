type t = Vector2 of float * float

let zero = Vector2 (0., 0.)
let add (Vector2 (x1, y1)) (Vector2 (x2, y2)) = Vector2 (x1 +. x2, y1 +. y2)
let scale scalar (Vector2 (x, y)) = Vector2 (scalar *. x, scalar *. y)
let norm (Vector2 (x, y)) = sqrt ((x ** 2.) +. (y ** 2.))

let (%+) a b = add a b
let (%*) t v = scale t v
let (%-) a b = add a (scale (-1.) b)
