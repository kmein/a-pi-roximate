let radius = 20.0

type point = { x : float; y : float }

let dist p = hypot p.x p.y

let approximation count =
    let random () = {x = Random.float radius; y = Random.float radius} in
    let rec randoms = function
        | 0 -> []
        | n -> random () :: randoms (n - 1) in
    let in_circle = List.length (List.filter (fun p -> dist p <= radius) (randoms count)) in
    4.0 *. float in_circle /. float count;;

for count = 1 to 100000 do
    Printf.printf "%6d %f" count (approximation count);
    print_newline()
done
