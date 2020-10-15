package re._1r.euler
package problems

<<<<<<< HEAD
import math.BigInt

object Euler88 {
  def search(l: Array[Int], lSum: Int, lPdt: Int, last: Int, up: Boolean): Array[Int] = {
    val index = if(lSum > lPdt && up) last //Increase -> Increase
    else if (lSum < lPdt && !up && l(last) > 1) last //Decrease -> Decrease
    else if (lSum < lPdt && !up) l.indices.find(l(_) > 1).getOrElse(0)
    else if (up) l.indices.find(i => i > last && l(i) > 1).getOrElse(l.indices.find(l(_) > 1).getOrElse(0)) //Increase -> Decrease
    else l.indices.find(_ != last).getOrElse(0) //Decrease -> Increase
    val nexts = if(lSum > lPdt || l(index) <= 1) {
      l(index) += 1
      (lSum + 1, lPdt * l(index) / (l(index) - 1))
    } else {
      l(index) -= 1
      (lSum - 1, lPdt * l(index) / (l(index) + 1))
    }
    if(nexts._1 == nexts._2) l
    else search(l, nexts._1, nexts._2, index, nexts._1 > lSum)
  }

  def result = {
    def n = 12
    (4 +: (3 to n).map(x => {
      val y = search(Array.fill(x)(2), 2 * x, math.pow(2, x).toInt, -1, true).sum
      println(s"${x}: ${y}")
      y
    })).distinct.sum
=======
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
>>>>>>> 586e1ba890d950595e7b542f79e1b28444ce88f1
  }
}