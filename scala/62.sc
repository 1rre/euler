package re._1r.euler
package problems

import scala.math.{cbrt,BigInt}
import utils.NumberOps._

object _62{
  def toPerms(n: IndexedSeq[(BigInt, String)]) = n.diff(n.distinctBy(_._2))
  def result = (BigInt(346) to BigInt(10000)).map(a => (a.pow(3),a.pow(3).toString.sorted)).reverse.groupBy(a => a._2.length).map(a => toPerms(toPerms(toPerms(toPerms(a._2))))).flatten.minBy(_._1)._1
}

