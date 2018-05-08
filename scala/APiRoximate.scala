import scala.util.Random

class Point(val x: Double, val y: Double) {
  def abs: Double = {
    Math.sqrt(x*x + y*y)
  }
}

object APiRoximate {
  def randomPoint(): Point = {
    val random = Random
    new Point(random.nextDouble, random.nextDouble)
  }

  def randomPoints(count: Int): Array[Point] = {
    var result: Array[Point] = new Array(count)
    for (i <- 0 until count) {
      result(i) = randomPoint()
    }
    result
  }

  def approximate(count: Int): Double = {
    val inCircle: Double = randomPoints(count).filter(_.abs <= 1).length
    4 * (inCircle / count)
  }

  def main(args: Array[String]): Unit = {
    for (n <- 1 to 100000) {
      println(s"$n ${approximate(n)}")
    }
  }
}
