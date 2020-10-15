package re._1r.euler.problems

object Euler81 {
  val sz = 80
  val matrix = scala.io.Source.fromFile("matrix.txt").getLines.map(_.split(",").map(_.toInt)).toArray
  val rtn = Array.fill(sz, sz)(Int.MaxValue)
  rtn(0)(0) = matrix(0)(0)
  def navigate(x: Int, y: Int): Unit = {
/*    if(x < sz - 1 && rtn(x + 1)(y) > matrix(x + 1)(y) + rtn(x)(y)) {
      rtn(x + 1)(y) = matrix(x + 1)(y) + rtn(x)(y)
      navigate(x + 1, y)
    }
    if(y < sz - 1 && rtn(x)(y + 1) > matrix(x)(y + 1) + rtn(x)(y)) {
      rtn(x)(y + 1) = matrix(x)(y + 1) + rtn(x)(y)
      navigate(x, y + 1)
    }*/
  }
  def result = {
    navigate(0, 0)
    rtn(sz - 1)(sz - 1)
  }
}