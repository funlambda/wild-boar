open UiLibrary

type path = | Path of Vector2.t array
type color = | Color of string

type model = {
    paths: (color * path) array
}

type 'v pathConfig = {
    color: color;
    path: 'v -> Vector2.t array
}

let mkPath color path = { color = color; path = path }

let mkBlock (configs: 'init pathConfig list) =
    let configs = configs |> Array.of_list in

    Static.block
    |> Block2.mapInit (fun init -> configs |> Array.map (fun c -> c.path init))
    |> Block2.mapModel (fun arr -> { paths = arr |> Array.mapi (fun i x -> (configs.(i).color, Path x)) })
