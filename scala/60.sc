package re._1r.euler
package problems

import utils.Primes._

object _60{
  val aprimes = genPrimes(1000000)
  val primes = aprimes.take(2000)
  def result = {
    var top = Int.MaxValue
    primes.foreach(a => {
      println("a = " + a)
      val p_a = primes.filter(a_ => a_ > a && a_ < top)
      p_a.filter(a_ => canConcat(a, a_)).foreach(b => {
        println("b = " + b)
        val p_b = p_a.filter(b_ => b_ > b && b_ < top)
        p_b.filter(b_ => canConcat(a, b_) && canConcat(b, b_)).foreach(c => {
          if(a == 13 && b == 5197 || a == 7 && b == 1237) println(c)
          val p_c = p_b.filter(c_ => c_ > c && c_ < top)
          p_c.filter(c_ => canConcat(a, c_) && canConcat(b, c_) && canConcat(c, c_)).foreach(d => {
            if(a == 13 && b == 5197 && c == 5701 || a == 7 && b == 1237 && c == 2341) println(d)
            val p_d = p_c.filter(d_ => d_ > d && d_ < top)
            p_d.filter(d_ => canConcat(a, d_) && canConcat(b, d_) && canConcat(c, d_) && canConcat(d, d_)).foreach(e => {
              top = a + b + c + d + e
              println(top)
            })
          })
        })
      })
    })
    top
  }
  def canConcat(a: Int, b: Int) = {
    val ab = (a.toString + b.toString, b.toString + a.toString)
    aprimes.contains(ab._1.toInt) && aprimes.contains(ab._2.toInt)
  }
}
