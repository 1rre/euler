package re._1r.euler
package problems

import math.BigInt
import collection.mutable._
import concurrent.Future
import concurrent.ExecutionContext.Implicits.global
import concurrent.duration._
import language.postfixOps
import scala.concurrent.Await
import scala.util.Failure
import scala.util.Success


object Euler88 {
  def max = 6
  def run(n: Int): Int = {
  def maxTime = 20 * n
    val futures = (1 to 12).map(x =>{
      Future {
        val x = Array.fill(n)(2)
        def findSum(start_time: Long = java.lang.System.currentTimeMillis): Int = {
          val sum = x.sum
          val mul = x.foldLeft(BigInt(1))(_ * BigInt(_))
          //println(s"${n}: ${x.mkString(",")}\n${sum}, ${mul}")
          if (sum == mul) {
            //println(s"${x.mkString(",")}\n\n\n")
            sum.toInt
          }
          else if (java.lang.System.currentTimeMillis - start_time > maxTime) {
            if(x.last < 5 * n) x(x.length - 1) = x.last + n else x(x.length - 1) = x.last - n
            findSum()
          } else if (mul < sum) {
            x.mapInPlace(_ + (if(util.Random.nextFloat > 0.9) util.Random.nextInt(3) + 1 else 0))
            findSum(start_time)
          } else {
            x.mapInPlace(i => math.max(1, i - (if(util.Random.nextFloat > 0.9) util.Random.nextInt(3) + 1 else 0)))
            findSum(start_time)
          }
        }
        findSum()
      }
    })
    while(!futures.exists(_.isCompleted)) {
    }
    futures.map(f => {
      util.Try(Await.result(f, maxTime millis)) match {
        case Failure(exception) => -1
        case Success(value) => value
      }
    }).min
  }
  def result = {
    (2 to 120).foldLeft(collection.mutable.HashSet[Int]())((acc, n) => {
      println(n)
      acc += run(n)
    }).sum
  }
}