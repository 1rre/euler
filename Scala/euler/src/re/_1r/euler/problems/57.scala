package re._1r.euler
package problems

import scala.math.{BigInt, BigDecimal}

object _57{
  def result = {
    (2 to 1000).foldLeft(Array[BigInt](1, 3))((acc, v) => acc :+ (acc(v - 2) + 2 * acc(v - 1))).tail.filter(numer => BigDecimal(numer) / BigDecimal(10).pow(numer.toString.length - 1) < math.sqrt(2)).length
  }
}
