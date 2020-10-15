package re._1r.euler
package problems

import utils.Primes._

object Euler87 {
  def n = 50000000
  val primes = genPrimes(math.sqrt(n).toInt)
  val map = new collection.mutable.HashMap[Int, Null]()
  def result = {
    def qd(pr4: Iterator[Int], sq: Int, cb: Int) {
      if(pr4.hasNext) {
        pr4.next match {
          case qd => {
            val x = qd * qd * qd * qd + cb * cb * cb + sq * sq
            if (x < n) map.put(x, null)
          }
        }
        qd(pr4, sq, cb)
      }
    }
    def cb(pr3: Iterator[Int], sq: Int): Unit = {
      if(pr3.hasNext) {
        pr3.next match {
          case cb if cb * cb * cb + sq * sq < n => qd(primes.iterator, sq, cb)
          case _ =>
        }
        cb(pr3, sq)
      }
    }
    def sq(pr2: Iterator[Int]): Unit = {
      if(pr2.hasNext) {
        cb(primes.iterator, pr2.next)
        sq(pr2)
      }
    }
    sq(primes.iterator)
    map.size
  }
}


object Euler87_ {
  def n = 50000000
  val primes = genPrimes(math.sqrt(n).toInt)
  val map = new collection.mutable.HashMap[Int, Null]()
  def result = {
    primes.foreach(i =>
      primes.takeWhile(j => i * i + j * j * j <= n).foreach(j => 
        primes.takeWhile(k => i * i + j * j * j + k * k * k * k <= n).foreach(k =>
          (i * i + j * j * j + k * k * k * k) match {
            case x if x <= n => map.put(x, null)
            case _ =>
          } 
        )
      )
    )
    map.size
  }
}