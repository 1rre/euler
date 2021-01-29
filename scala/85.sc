package re._1r.euler
package problems

object Euler85 {
  def pys(a: Int, b: Int, c: Int) = {
    math.hypot(a * b / (b + c).toDouble, b) + math.hypot(a * c / (b + c).toDouble, c)
  }
  def n = 500
  def result = {
    var cnt = 0
    for(i <- 1 to n; j <- i to n; k <- j to n) {
      val py = pys(k, j, i)
      if(py == py.toInt) {
        cnt += 1
      }
    }
    cnt
  }
}

