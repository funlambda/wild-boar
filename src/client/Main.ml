(* let floatEditor = 
    Textbox.block 
    |> mapInit string 
    |> mapValue Common.tryParseFloat

let floatPicker min max =
    Bound.mutually
        floatEditor
        (Slider.block |> mapValue (fun x -> min + (x * (max - min))) |> Block.mapValue Some)
    |> mapValue Option.get

let interactivePathChart pathConfigs variablesEditor initialValue =
    Bound.secondToFirst
        (PathChart.mkBlock pathConfigs |> Block.mapValue Some)
        (variablesEditor |> Block.mapValue Some)
    |> mapInit (fun () -> initialValue)
    |> mapValue ignore


let stepT = 0.0001
let stepV = 0.001

let chart0 =
    interactivePathChart [|
        PathChart.mkPath (PathChart.Color "#0074d9") (fun finalT -> Problem.farmerPosition |> Util2.trace (0., finalT))
    |] (floatPicker 0. 1.) 0.5

let chart1 =
    interactivePathChart [|
        PathChart.mkPath (PathChart.Color "red") (fun finalT -> let f = Problem.sameSpeedSolution stepT in f |> Util2.traceOptional (0., finalT))
        PathChart.mkPath (PathChart.Color "#0074d9") (fun finalT -> Problem.farmerPosition |> Util2.trace (0., finalT))
    |] (floatPicker 0. 1.) 0.5

let chart2 =
    interactivePathChart [|
        PathChart.mkPath (PathChart.Color "red") (fun (v, finalT) -> Problem.computeSolutionForBoarSpeed v stepT |> Util2.traceOptional (0., finalT))
        PathChart.mkPath (PathChart.Color "#0074d9") (fun (_, finalT) -> Problem.farmerPosition |> Util2.trace (0., finalT))
    |] ((floatPicker 0. 2.) <&&> (floatPicker 0. 1.)) (1.0, 0.5)

let precomputed = Problem.precomputeGeneralSolution (0., 1.) (0., 2.) stepT stepV

let chart3 =
    interactivePathChart [|
        PathChart.mkPath (PathChart.Color "red") (fun (v, finalT) -> precomputed v |> Util.trace (0., finalT))
        PathChart.mkPath (PathChart.Color "#0074d9") (fun (_, finalT) -> Problem.farmerPath |> Util.trace (0., finalT))
    |] ((floatPicker 0. 2.) ++ (floatPicker 0. 1.)) (1.0, 0.5)

let finalPositionForV v = 
    Problem.computeSolutionForRamSpeed v stepT 1.0 |> Option.get

let chart4 =
    PathChart.mkBlock [|
        PathChart.mkPath (PathChart.Color "red") (fun () -> finalPositionForV |> Util.trace (0., 2.))
    |]


let blocks = 
    createObj [
        "chart0" ==> chart0
        "chart1" ==> chart1
        "chart2" ==> chart2
    ]
 *)
