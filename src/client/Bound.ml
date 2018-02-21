(* let mutually block1 block2 =
    (block1, block2)
    |> Reactor.mkBlock2
        (fun (a,b1,b2) -> 
            match a with 
            | Choice1Of2 _ ->
                match b1.BlockValue with | Some v -> [| Choice2Of2 (Reactor.ReInit v) |] | None -> [| |]
            | Choice2Of2 _ ->
                match b2.BlockValue with | Some v -> [| Choice1Of2 (Reactor.ReInit v) |] | None -> [| |])
    |> mapInit (fun v -> v, v)
    |> mapValue snd

let secondToFirst block1 block2 =
    (block1, block2)
    |> Reactor.mkBlock2
        (fun (a,_,b2) -> 
            match a with 
            | Choice1Of2 _ -> [| |]
            | Choice2Of2 _ ->
                match b2.BlockValue with
                | Some v -> [| Choice1Of2 (Reactor.ReInit v) |]
                | None -> [| |])
    |> mapInit (fun x -> x, x)
    |> mapValue snd *)
