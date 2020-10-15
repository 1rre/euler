package re._1r.euler
package problems

<<<<<<< HEAD
import math.BigInt

object Euler94 {
  def checkSide(a: Double, b: Double): BigInt = {
    if ((b / 2 * math.sqrt(a * a - b * b / 4)).isValidInt) BigInt(2) * a.toInt + b.toInt else 0
  }
  def result = {
    (BigInt(2) to 100000000).reduce((acc, s) => {
      acc + checkSide(s.toDouble, (s - 1).toDouble) + checkSide(s.toDouble, (s + 1).toDouble)
=======
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
>>>>>>> 586e1ba890d950595e7b542f79e1b28444ce88f1
    })
  }
}

<<<<<<< HEAD
/*

1/4 - 1/6
3/12 - 2/12
1 / 12
1/6

*/
=======
>>>>>>> 586e1ba890d950595e7b542f79e1b28444ce88f1
