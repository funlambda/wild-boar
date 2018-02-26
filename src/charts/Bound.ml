open BsUiLibrary
open BsUiLibrary.Util.LeftRight

let mutually block1 block2 =
    (block1, block2)
    |> Reactor.mkBlock2 (fun (a,b1,b2) -> 
        match a with 
        | Left _ ->
            (match b1.value with 
             | Some v -> [ Right (Reactor.ReInit v) ]
             | None -> [ ])
        | Right _ ->
            (match b2.value with 
             | Some v -> [ Left (Reactor.ReInit v) ] 
             | None -> [ ]))
    |> Block2.mapInit (fun v -> v, v)
    |> Block2.mapValue snd
    |> Block2.mapModel (fun (l,r) -> [%bs.obj {
        __tag = "Bound";
        left = l;
        right = r;
    }])

let secondToFirst block1 block2 =
    (block1, block2)
    |> Reactor.mkBlock2
        (fun (a,_,b2) -> 
            match a with 
            | Left _ -> [ ]
            | Right _ ->
                (match b2.value with
                 | Some v -> [ Left (Reactor.ReInit v) ]
                 | None -> [ ]))
    |> Block2.mapInit (fun x -> x, x)
    |> Block2.mapValue snd
    |> Block2.mapModel (fun (l,r) -> [%bs.obj {
        __tag = "Bound";
        left = l;
        right = r;
    }])
