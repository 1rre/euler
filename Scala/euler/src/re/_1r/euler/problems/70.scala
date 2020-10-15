package re._1r.euler
package problems

import math._
import utils.Primes._
import utils.NumberOps.intOps
import collection.mutable.HashMap

object Euler70 {
  val pfMap = HashMap[Int, Array[Int]]()
  def primeFactors(n: Int, primes: Array[Int]): Array[Int] = {
    if(n % 10000 == 0) println(n)
    if(n==1) Array()
    else if(primes.last == n) Array(n)
    else {
      def divisor = primes.find(n % _ == 0).getOrElse(1)
      divisor +: pfMap(n / divisor)
    }
  }
  def n = 10000000
  val primes = genPrimes(n)
  def result = {
    (2 until n).foreach(i => pfMap += ((i, primeFactors(i, primes.takeWhile(_ <= i)))))
    pfMap.map{case (a, b) => (a, b.distinct.map(_.toDouble).fold(a.toDouble)((acc, v) => acc * (1 - 1 / v.toDouble)).toInt)}.filter{case (a, b) => a.digits.sorted == b.digits.sorted}.minBy{case (a, b) => a.toDouble / b.toDouble}
  }
}