let tolerance = 0.0000000000001

let solve (initialT, finalT) (initialPosition: Vector2.t) stepSize (velocityFunc: Vector2.t -> float -> Vector2.t) =
    let rec loop t position acc =
        if t > finalT +. tolerance then
            acc |> List.rev
        else
            let velocity = velocityFunc position t in
            let positionDelta = Vector2.scale stepSize velocity in

            let newPosition = Vector2.add position positionDelta in
            let newT = t +. stepSize in
            
            loop newT newPosition (newPosition::acc) in

    loop initialT initialPosition [ ]
    |> Array.of_list
    |> NumericalSolution.mk initialT stepSize

(* let solveImperative (initialT, finalT) (initialPosition: Vector2.t) stepSize (velocityFunc: Vector2.t -> float -> Vector2.t) =
    let position = ref initialPosition in
    let t = ref initialT in
    let acc = ref [ initialPosition ] in

    while t <= (finalT +. tolerance) do
        let velocity = velocityFunc position t in
        let positionDelta = Vector2.scale stepSize velocity in

        position <- Vector2.add position positionDelta
        t <- t + stepSize
        acc <- position::acc

    acc
    |> List.rev
    |> List.toArray
    |> NumericalSolution.mk initialT stepSize *)
