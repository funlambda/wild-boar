type 'value t = {
    min: float;
    stepSize: float;
    values: 'value array
}

let mk min stepSize values = { min = min; stepSize = stepSize; values = values }

let areCompatible ns1 ns2 = 
    ns1.min = ns2.min && ns1.stepSize = ns2.stepSize && Array.length ns1.values = Array.length ns2.values

let add (valueAdd) (ns1: 'a t) (ns2: 'a t) =
    if not (areCompatible ns1 ns2) then failwith "ex"
    else mk ns1.min ns1.stepSize (ns1.values |> Array.mapi (fun i x -> valueAdd x ns2.values.(i)))

let scale (valueScale) s (ns: 'a t) =
    mk ns.min ns.stepSize (ns.values |> Array.map (fun x -> valueScale s x))

let toFunction (add: 'value -> 'value -> 'value) (scale: float -> 'value -> 'value) (solution: 'value t) =
    let interpolate (ratio: float) (leftVal: 'value) (rightVal: 'value) =
        let diff = add rightVal (scale (-1.0) leftVal) in
        scale ratio diff in

    fun t ->
        if t < solution.min || t > (solution.min +. (solution.stepSize *. (float_of_int (Array.length solution.values)))) then 
          None
        else
            let (idx, decimalPart) = (t -. solution.min) /. solution.stepSize |> Util.intAndDecimalPart in

            let result = 
              if (idx = ((Array.length solution.values) - 1)) then
                solution.values.(idx)
              else
                add (solution.values.(idx)) (interpolate decimalPart solution.values.(idx) solution.values.(idx + 1)) in
              
            Some result
