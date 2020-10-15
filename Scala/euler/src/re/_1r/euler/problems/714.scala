package re._1r.euler
package problems

import math.BigInt
import scala.util.Success
import scala.util.Failure
object Euler714 {
  val map = collection.mutable.HashMap[BigInt,BigInt]()
  def isDuo(x: BigInt): Boolean = {
    val y = x.toString
    y.find(z => z != '0' && z != y.find(_ != '0').get).isEmpty
  }
  def findDuo(duo: BigInt, n: BigInt, futre: Int): BigInt = {
    if((duo / 3170) % 999959 == 0) println(s"${futre} -- ${duo}")
    if (isDuo(duo)) duo
    else findDuo(duo + n, n, futre)
  }
  def num = 3000
  def target = 4910
  def fut = 8
  def result = {
    import concurrent._
    import ExecutionContext.Implicits.global
    val futures = Array.tabulate(fut)(x_ => {
      Future {
        val x = target * (x_ + 1)
        val y = findDuo(x, target * fut, x_)
        println(x.toString + ": " + y.toString)
      }
    })
    futures.map(_.onComplete{
      case Success(value) => {
        println(value)
        //System.exit(0)
      }
      case Failure(exception) => 
    })
    while (!futures.exists(_.isCompleted)) {}
    //futures.map(_.value.get.get).sum
  }
}
