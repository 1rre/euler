package re._1r.euler
package problems

import collection.mutable.ArrayBuffer
import math.BigInt

object Euler88 {
  def compareSums(v: ArrayBuffer[BigInt], end: Int, n: Int): BigInt = {
    val product = v.product
    val sum = v.sum
    println(product.toString + " & " + sum.toString + "\n" +  v.mkString(","))
    if (end == v.length - 1 && sum > product) {
      v(end) = n
      compareSums(v, 0, n)
    } else if (end == v.length - 1 && sum < product && v(end) > 1) {
      v(end) -= 1
      compareSums(v, 0, 1)
    } else if (end == v.length - 1 && sum < product && n > 1) {
      v(end) = 2
      compareSums(v, 0, 1)
    } else if (end == v.length - 1 && sum < product) {
      v(end) = n
      compareSums(v, 0, 1)
    } else if(sum > product) {
      v(end) = n
      compareSums(v, end + 1, n + 1)
    } else if (sum < product && n > 1) {
      v(end) = n - 1
      compareSums(v, end + 1, 2)
    } else if (sum < product) {
      v(end) = n
      compareSums(v, end + 1, 1)
    } else sum
  }
  def nn = 200
  def start = 2
  def result = {
    val vec = ArrayBuffer.fill(start - 1)(BigInt(1))
    (start to nn).map(BigInt(_)).fold(BigInt(0))((acc, i) => {
      vec.mapInPlace(_ => 1)
      //println(vec.mkString(","))
      vec += (1)
      val x = compareSums(vec, 0, 2)
      println(s"${i}: ${x}")
      acc + x
    })
  }
}