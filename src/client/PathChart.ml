let x = 2


(* type Path = Path of Vector2 array
type Color = Color of string

type Model = {
    Paths: (Color * Path) array
}

type PathConfig<'Init> = {
    Color: Color
    Path: 'Init -> Vector2 array
}

let mkPath color path = { Color = color; Path = path }

let mkBlock (configs: PathConfig<'Init> array) =
    Static.mkBlock ()
    |> Block.mapInit (fun init -> configs |> Array.map (fun c -> c.Path init))
    |> Block.mapModel (fun arr -> { Paths = arr |> Array.mapi (fun i x -> (configs.[i].Color, Path x)) }) *)
