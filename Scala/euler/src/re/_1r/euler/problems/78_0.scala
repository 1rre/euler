package re._1r.euler
package problems

object Euler78_0 {
  def n = 30
  val sub = 0 +: Array.fill(n)(1)
  def calc(x: Int) = {
    sub(x) += sub(x - 1) + (1 until x / 2).fold(0)((acc, v) => {
      acc + sub(v)
    })
    //println(sub(x))
  }
  def result = {
    (1 to n).foreach(x => {
      calc(x)
      println(s"${x}: ${sub(x)}")
    })
  }
}

//1, 2, 3, 5, 7