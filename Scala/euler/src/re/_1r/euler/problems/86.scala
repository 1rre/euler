package re._1r.euler
package problems

import math.hypot

object Euler86 {
  def calc(a: Int, b: Int, c: Int): Double = {
    math.hypot(a, b + c)
  }
  def target = 1e6
  def n = 1818
  def result = {
    var cnt = 0
    if(n % 100 == 0) println(n)
    for(i <- 1 to n) {
      println(i)
      for(j <- i to n; k <- j to n) {
        val x = calc(k, j, i)
        if(x == x.toInt) {
          cnt += 1
        }
      }

    }
    cnt
  }
}
