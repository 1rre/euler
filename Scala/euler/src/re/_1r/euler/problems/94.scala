package re._1r.euler
package problems

object Euler94 {
  def result = {
    (math.BigInt(1) to 1e9.toInt).filter(v => v * v + 2 * v + 1 % 4 == 0 || v * v - 2 * v + 1 % 4 == 0 ).map(_.toDouble).reduce((acc, v) => {
      println(acc)
      acc + (math.sqrt(v * v - (v * v + 2 * v + 1) / 4) match {
        case x if x == x.floor => v * 3 + 1
        case _ => 0
      }) + (math.sqrt(v * v - (v * v - 2 * v + 1) / 4) match {
        case x if x == x.floor => v * 3 - 1
        case _ => 0
      })
    })
  }
}

