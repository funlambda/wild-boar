(* let createFunction2 plus minus scalarMultiply (solution: NumericalSolution.T<'a>) =
    fun t ->
        if t < solution.Min || t > (solution.Min + (solution.StepSize * (float solution.Values.Length))) then None
        else
            let (idx, decimalPart) = (t - solution.Min) / solution.StepSize |> intAndDecimalPart
            let result = 
                if idx = solution.Values.Length - 1 then solution.Values.[idx]
                else
                    plus solution.Values.[idx] (interpolate2 minus scalarMultiply decimalPart solution.Values.[idx] solution.Values.[idx + 1])
            Some result


let createFunction2D (stepSizeX: float, stepSizeY: float) (startX: float, startY: float) (points: (float * float) array array) =
    let numX = points.Length
    let numY = points.[0].Length

    let endX = startX + stepSizeX * (float numX)
    let endY = startY + stepSizeY * (float numY)

    fun (x,y) ->
        if x < startX || x > endX then None
        elif x < startY || x > endY then None
        else
            let (i, remainderX) = (x - startX) / stepSizeX |> intAndDecimalPart
            let (j, remainderY) = (y - startY) / stepSizeY |> intAndDecimalPart
            let result = 
                if i = numX - 1 && j = numY - 1 then 
                    points.[i].[j]
                elif i = numX - 1 then
                    points.[i].[j] +! (interpolate remainderY points.[i].[j] points.[i].[j + 1])
                elif j = numY - 1 then
                    points.[i].[j] +! (interpolate remainderX points.[i].[j] points.[i + 1].[j])
                else
                    points.[i].[j] +! (interpolate2D (remainderX, remainderY) points.[i].[j] points.[i + 1].[j] points.[i].[j + 1] points.[i + 1].[j + 1])
            Some result


let interpolate2D (ratioX, ratioY) bottomLeftVal bottomRightVal topLeftVal topRightVal =
    let bottomVal = interpolate ratioX bottomLeftVal bottomRightVal
    let topVal = interpolate ratioX topLeftVal topRightVal

    interpolate ratioY bottomVal topVal


let interpolate2 minus scalarMultiply (ratio: float) (leftVal: 'a) (rightVal: 'a): 'a =
    let diff = minus rightVal leftVal
    scalarMultiply ratio diff
 *)
