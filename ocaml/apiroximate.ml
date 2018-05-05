open Complex

let approximation count =
    let random () = {re = Random.float 1.; im = Random.float 1.} in
    let rec randoms = function
        | 0 -> []
        | n -> random () :: randoms (n - 1) in
    let in_circle = List.length (List.filter (fun p -> norm p <= 1.) (randoms count)) in
    4.0 *. float in_circle /. float count;;

for count = 1 to 100000 do
    Printf.printf "%6d %f" count (approximation count);
    print_newline()
done
