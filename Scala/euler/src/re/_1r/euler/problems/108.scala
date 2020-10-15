package re._1r.euler.problems

import scala.concurrent._
import ExecutionContext.Implicits.global

object Euler108 {
  def gcd(a: Int, b: Int): Int = {
    if (a == 0) b else if (b == 0) a else {
      gcd(b, a % b)
    }
  }
  def recip(n: Int) = {
    (n + 1 to 2 * n).count(v => {
      val lcm = n * v / gcd(n, v)
      1d / v + 1d / lcm == 1d / n
    })
  }
  def result = {
    def top = 100
    val f = Array(
      Future((1 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((2 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((3 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((4 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((5 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((6 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((7 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((8 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((9 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((10 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((11 to Int.MaxValue by 12).find(recip(_) > top).get),
      Future((12 to Int.MaxValue by 12).find(recip(_) > top).get)
    )
    while(!f.exists(_.isCompleted)) {}
    f.find(_.isCompleted).get.value.get.get
  }
}