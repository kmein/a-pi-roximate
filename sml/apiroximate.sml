type Point = {x: real, y: real}

val radius: real = 20.0
val rand = Random.rand(0, 0)

fun distance(p: Point): real =
  Math.sqrt(Math.pow(#x p, 2.0) + Math.pow(#y p, 2.0));

fun approximation(count: int): real =
  let
    fun randomPoint(): Point =
      {x = Random.randReal rand * radius, y = Random.randReal rand * radius}
    fun randoms 0 = []
      | randoms n = randomPoint() :: randoms (n-1)
    val inCircle = List.length(List.filter (fn p => distance p <= radius) (randoms count))
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
