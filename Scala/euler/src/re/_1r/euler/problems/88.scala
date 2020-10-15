package re._1r.euler
package problems

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
  }
}