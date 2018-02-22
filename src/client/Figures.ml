open Util
open BsUiLibrary.Util
open BsUiLibrary
open BsUiLibrary.Operators

let floatEditor = 
    Textbox.block 
    |> Block2.mapInit string_of_float 
    |> Block2.mapValue float_of_string_opt

let floatPicker min max =
    Block2.(
        Bound.mutually
            floatEditor
            (Slider.block 
             |> mapValue (fun x -> Some (min +. (x *. (max -. min))))
             |> mapValue (fun x ->  x))
        |> mapValue getOption)

let interactivePathChart pathConfigs variablesEditor initialValue =
    Block2.(
        Bound.secondToFirst
            (PathChart.mkBlock pathConfigs |> mapValue (fun x -> Some x))
            (variablesEditor |> mapValue (fun x -> Some x))
        |> mapInit (fun () -> initialValue)
        |> mapValue ignore)

let stepT = 0.0001
let stepV = 0.001

let chart0 =
    interactivePathChart [
        PathChart.mkPath (PathChart.Color "#0074d9") (fun finalT -> Problem.farmerPosition |> trace (0., finalT))
    ] (floatPicker 0. 1.) 0.5

let chart1 =
    interactivePathChart [
        PathChart.mkPath (PathChart.Color "red") (fun finalT -> let f = Problem.sameSpeedSolution stepT in f |> traceOptional (0., finalT));
        PathChart.mkPath (PathChart.Color "#0074d9") (fun finalT -> Problem.farmerPosition |> trace (0., finalT))
    ] (floatPicker 0. 1.) 0.5

let chart2 =
    interactivePathChart [
        PathChart.mkPath (PathChart.Color "red") (fun (v, finalT) -> Problem.computeSolutionForBoarSpeed v stepT |> traceOptional (0., finalT));
        PathChart.mkPath (PathChart.Color "#0074d9") (fun (_, finalT) -> Problem.farmerPosition |> trace (0., finalT))
    ] ((floatPicker 0. 2.) <&&> (floatPicker 0. 1.)) (1.0, 0.5)

(*
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

 *)
