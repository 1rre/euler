package re._1r.euler
package problems

import utils.InfiniteRootSum
import math.{pow, sqrt, BigDecimal}
import concurrent.{Await, Future}
import concurrent.ExecutionContext.Implicits.global
import util.Success

object _64 {
  def period(dt: Int): Int = {
    if(sqrt(dt).isValidInt) 0
    else {
      def recStarts(subRep: Vector[Int], testInit: Vector[Int]): Boolean = {
        val sLen = subRep.length
        val iLen = testInit.length
        if (sLen >= 2 * iLen && subRep.startsWith(testInit)) {
          recStarts(subRep.drop(iLen), testInit)
        }
        else if (sLen >= iLen && subRep.startsWith(testInit)) true
        else false
      }
      val ints = (1 to dt).foldLeft((Vector[Int](),new InfiniteRootSum(dt).next))((cur, v) => {
        (cur._1 :+ cur._2.int, cur._2.next)
      })._1
      ints.init.zipWithIndex.foreach(ind => {
        val testInit = ints.take(ind._2 + 1)
        if(recStarts(ints, testInit)) return testInit.length
      })
      -1
    }
  }
  def result = {
    val f1 = Future((1 to 834).count(i => period(i) % 2 == 1))
    val f2 = Future((835 to 1668).count(i => period(i) % 2 == 1))
    val f3 = Future((1669 to 2501).count(i => period(i) % 2 == 1))
    val f4 = Future((2502 to 3334).count(i => period(i) % 2 == 1))
    val f5 = Future((3335 to 4167).count(i => period(i) % 2 == 1))
    val f6 = Future((4168 to 5001).count(i => period(i) % 2 == 1))
    val f7 = Future((5002 to 5834).count(i => period(i) % 2 == 1))
    val f8 = Future((5835 to 6667).count(i => period(i) % 2 == 1))
    val f9 = Future((6668 to 7500).count(i => period(i) % 2 == 1))
    val fa = Future((7501 to 8334).count(i => period(i) % 2 == 1))
    val fb = Future((8335 to 9167).count(i => period(i) % 2 == 1))
    val fc = Future((9168 to 10000).count(i => period(i) % 2 == 1))
    val futures = Vector(f1, f2, f3, f4, f5, f6, f7, f8, f9, fa, fb, fc)
    var rtn = 0
    //futures.foreach(_.onComplete{case Success(res) => rtn = rtn + res})
    while(!futures.forall(_.isCompleted)) {}
    rtn
  }
}