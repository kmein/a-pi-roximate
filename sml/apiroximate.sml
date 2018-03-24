type Point = {x: real, y: real}

val rand = Random.rand(0, 0)

fun distance(p: Point): real =
  Math.sqrt(Math.pow(#x p, 2.0) + Math.pow(#y p, 2.0));

fun approximation(count: int): real =
  let
    fun randomPoint(): Point =
      {x = Random.randReal rand, y = Random.randReal rand}
    fun randoms 0 = []
      | randoms n = randomPoint() :: randoms (n-1)
    val inCircle = List.length(List.filter (fn p => distance p <= 1.0) (randoms count))
  in
    4.0 * real inCircle / real count
  end

fun main() =
  let
    val count = ref 1
  in
    while !count <= 100000 do (
      print (Int.toString(!count) ^ " " ^ Real.toString(approximation(!count)) ^ "\n");
      count := !count + 1
    )
  end
