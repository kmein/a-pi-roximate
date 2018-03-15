let radius: float = 20.0

type point = { x : float; y : float }

let dist (p: point): float = hypot p.x p.y

let random (): point = {x = Random.float radius; y = Random.float radius}

let randoms (count: int): point list =
    let rec replicate x = function
        | 0 -> []
        | n -> x :: replicate x (n - 1)
    in List.map random (replicate () count)

let approximation (count: int): float =
    let in_circle = List.length (List.filter (fun p -> dist p <= radius) (randoms count))
    in 4.0 *. float in_circle /. float count;;

for count = 1 to 100000 do
    Printf.printf "%6d %f" count (approximation count);
    print_newline()
done
