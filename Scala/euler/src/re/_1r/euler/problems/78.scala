package re._1r.euler
package problems

import math.BigInt

object Euler78 {
  val parts = collection.mutable.ArrayBuffer.fill(1)(BigInt(1))
  def sign(k: BigInt) = if ((k + 1).abs % 2 == 0) BigInt(1) else BigInt(-1)
  def partition(n: BigInt): BigInt = { //https://en.wikipedia.org/wiki/Partition_function_(number_theory) - Pi = Product
    if (n > 0) {
      val sqrt = math.sqrt((24 * n + 1).toDouble)
      ((-(sqrt - 1) / 6).toInt to ((sqrt + 1) / 6).toInt).foldLeft(BigInt(0))((acc, k) => {
        if (k == 0) acc else {
          acc + parts((n - (k * (3 * k - 1) / 2)).toInt) * sign(k)
        }
      })
    } else if (n == 0) 1 else 0
  }
  def result: BigInt = {
    (1 to Int.MaxValue).foreach(x => {
      val y = partition(x)
      parts += y
      if (y % 1000000 == 0) return(x)
    })
    0
  }
}

//BAFA510
//03333381039