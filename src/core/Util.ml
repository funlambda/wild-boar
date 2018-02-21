open UiLibrary.Util

let getPoints ((min: float), (max: float), (step: float)) =
  let n = ((max -. min) /. step) |> floor |> int_of_float in

  Array.make n ()
  |> Array.mapi (fun i () -> min +. ((float_of_int i) *. step))

let trace (minT, maxT) f =
    getPoints (minT, maxT, 0.01)
    |> Array.map f

let traceOptional (minT, maxT) f =
    trace (minT, maxT) f
    |> Array.to_list
    |> List.filter (function | Some _ -> true | _ -> false)
    |> List.map UiLibrary.Util.getOption
    |> Array.of_list

let roundFloat f = floor (f +. 0.5)

let intAndDecimalPart (x: float) = 
    let rounded = roundFloat x in
    let decimal = x -. rounded in
    int_of_float rounded, decimal
