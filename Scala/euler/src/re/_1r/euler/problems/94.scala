package re._1r.euler
package problems

import math.BigInt

object Euler94 {
  def checkSide(a: Double, b: Double): BigInt = {
    if ((b / 2 * math.sqrt(a * a - b * b / 4)).isValidInt) BigInt(2) * a.toInt + b.toInt else 0
  }
  def result = {
    (BigInt(2) to 100000000).reduce((acc, s) => {
      acc + checkSide(s.toDouble, (s - 1).toDouble) + checkSide(s.toDouble, (s + 1).toDouble)
    })
  }
}

/*

1/4 - 1/6
3/12 - 2/12
1 / 12
1/6

*/