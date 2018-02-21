open Vector2

let farmerPosition (t: float) = Vector2 (1., t)

let boarVelocity (boarSpeed: float) boarPosition (t: float) =
    (boarSpeed /. (norm ((farmerPosition t) %- boarPosition))) %* (farmerPosition t %- boarPosition)

let computeSolutionForBoarSpeed boarSpeed stepT =
    boarVelocity boarSpeed
    |> Solver.solve (0., 1.) (Vector2 (0., 0.)) stepT
    |> NumericalSolution.toFunction (%+) (%*)

let sameSpeedSolution stepT = computeSolutionForBoarSpeed 1.0 stepT

(* let precomputeGeneralSolution (minT, maxT) (minV, maxV) stepT stepV =
    let numSolution =
        Util.getPoints (minV,maxV,stepV)
        |> Array.map (boarVelocity |> Solver.solve (minT, maxT) Vector2.zero 0.005)
        |> NumericalSolution.mk minV stepV in

    let continuousFunction =
        numSolution
        |> NumericalSolution.toFunction (NumericalSolution.add Vector2.add (NumericalSolution.scale Vector2.scale)
        >> Option.get
        >> NumericalSolution.toFunction Vector2.add Vector2.scale
        >> ((<<) Option.get) in

    continuousFunction *)
