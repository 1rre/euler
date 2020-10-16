package re._1r.euler.problems

import collection.mutable.ArrayBuffer


object Primes {
  def genPrimes (max: Int, n: Int = 1, acc: ArrayBuffer[Int] = ArrayBuffer(), out: ArrayBuffer[Int] = ArrayBuffer()): String = {
    val acc1: ArrayBuffer[Int] = if (out.size > 0) acc.diff((2 to max / n).map(_ * n)) else ArrayBuffer.tabulate(max - 1)(_ + 2)
    if(acc1.size > 0) {
      genPrimes(max, acc1.head, acc1.tail, out :+ acc1.head)
    } else {
      out.mkString(",")
    }
  }
}