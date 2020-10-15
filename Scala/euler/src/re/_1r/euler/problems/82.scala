package re._1r.euler.problems

object Euler82 {
  val sz = 80
  val matrix = scala.io.Source.fromFile("matrix.txt").getLines.map(_.split(",").map(_.toInt)).toArray
  val rtn = Array.fill(sz, sz)(Int.MaxValue)
  matrix.indices.foreach(x => rtn(x)(0) = matrix(x)(0))
  def navigate(x: Int, y: Int): Unit = {
    if(x < sz - 1 && rtn(x + 1)(y) > matrix(x + 1)(y) + rtn(x)(y)) {
      rtn(x + 1)(y) = matrix(x + 1)(y) + rtn(x)(y)
      navigate(x + 1, y)
    }
    if(x > 0 && rtn(x - 1)(y) > matrix(x - 1)(y) + rtn(x)(y)) {
      rtn(x - 1)(y) = matrix(x - 1)(y) + rtn(x)(y)
      navigate(x - 1, y)
    }
    if(y < sz - 1 && rtn(x)(y + 1) > matrix(x)(y + 1) + rtn(x)(y)) {
      rtn(x)(y + 1) = matrix(x)(y + 1) + rtn(x)(y)
      navigate(x, y + 1)
    }
  }
  def result = {
    rtn.indices.foreach(navigate(_, 0))
    rtn.map(_.last).min
  }
}