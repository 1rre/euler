package re._1r.euler
package problems

    import concurrent._
    import ExecutionContext.Implicits.global
import scala.util.Success
import scala.util.Failure

object Euler714_0 {
  val map = collection.mutable.HashMap[BigInt,BigInt]()
  def isDuo(x: BigInt): Boolean = {
    val y = x.toString
    val z = y.find(p => p != y.head)
    if(z.nonEmpty) {
      y.find(p => p != y.head && p != z.get).isEmpty
    } else {
      true
    }
  }
  def findDuo(duo: BigInt, n: BigInt): BigInt = {
    if (isDuo(duo)) duo
    else findDuo(duo + n, n)
  }
  def num = 50000
  def fut = 317
  def result = {
    import utils.Primes._

    val primes = genPrimes(num)
    val futures0 = Array.tabulate(fut)(nn => {
      Future((nn + 1 to num / 3 by fut).foldLeft(BigInt(0))((acc, v) => {
        println((nn + 1).toString + " -- " + v.toString)
        val x: BigInt = if (v < 102 || isDuo(v)) v
        else if(primes.takeWhile(v <= _).contains(v)) findDuo(v, v)
        else {
          val fnd = (2 to math.sqrt(v).toInt).find(y => v % y == 0 && map.contains(v / y))
          if(fnd.nonEmpty) {
            val fn = map(v / fnd.get)
            if (fn % v == 0) fn
            else if (map.contains(fnd.get) && isDuo((map(fnd.get) / fnd.get) * v)) (map(fnd.get) / fnd.get) * v
            else findDuo(v, v)
          }
          else findDuo(v, v)
        }
        map.put(v, x)
        acc + x
      }))
    })
    
    futures0.zipWithIndex.foreach(x => x._1.onComplete {
      case Success(value) => {
        println(s"${x._2 + 1} Complete\n${futures0.zipWithIndex.filterNot(_._1.isCompleted).map(_._2 + 1).mkString(", ")} remain.")
      }
      case Failure(exception) => 
    })
    val futures1 = Array.tabulate(fut)(nn => {
      Future((num / 3 + nn + 1 to 2 * num / 3 by fut).foldLeft(BigInt(0))((acc, v) => {
        println((nn + 1).toString + " -- " + v.toString)
        val x: BigInt = if (v < 102 || isDuo(v)) v
        else if(primes.takeWhile(v <= _).contains(v)) findDuo(v, v)
        else {
          val fnd = (2 to math.sqrt(v).toInt).find(y => v % y == 0 && map.contains(v / y))
          if(fnd.nonEmpty) {
            val fn = map(v / fnd.get)
            if (fn % v == 0) fn
            else if (map.contains(fnd.get) && isDuo((map(fnd.get) / fnd.get) * v)) (map(fnd.get) / fnd.get) * v
            else findDuo(v, v)
          }
          else findDuo(v, v)
        }
        map.put(v, x)
        acc + x
      }))
    })
    
    futures1.zipWithIndex.foreach(x => x._1.onComplete {
      case Success(value) => {
        println(s"${x._2 + 1} Complete\n${futures1.zipWithIndex.filterNot(_._1.isCompleted).map(_._2 + 1).mkString(", ")} remain.")
      }
      case Failure(exception) => 
    })
    val futures2 = Array.tabulate(fut)(nn => {
      Future((2 * num / 3 + nn + 1 to num by fut).foldLeft(BigInt(0))((acc, v) => {
        println((nn + 1).toString + " -- " + v.toString)
        val x: BigInt = if (v < 102 || isDuo(v)) v
        else if(primes.takeWhile(v <= _).contains(v)) findDuo(v, v)
        else {
          val fnd = (2 to math.sqrt(v).toInt).find(y => v % y == 0 && map.contains(v / y))
          if(fnd.nonEmpty) {
            val fn = map(v / fnd.get)
            if (fn % v == 0) fn
            else if (map.contains(fnd.get) && isDuo((map(fnd.get) / fnd.get) * v)) (map(fnd.get) / fnd.get) * v
            else findDuo(v, v)
          }
          else findDuo(v, v)
        }
        map.put(v, x)
        acc + x
      }))
    })
    
    futures2.zipWithIndex.foreach(x => x._1.onComplete {
      case Success(value) => {
        println(s"${x._2 + 1} Complete\n${futures2.zipWithIndex.filterNot(_._1.isCompleted).map(_._2 + 1).mkString(", ")} remain.")
      }
      case Failure(exception) => 
    })
    while(!futures2.forall(_.isCompleted)) {}
    futures0.map(_.value.get.get).sum + futures1.map(_.value.get.get).sum + futures2.map(_.value.get.get).sum 
  }
}

