package re._1r.euler
package problems

import utils.Primes._

object _58{
  val primes = genPrimes(1000000000)
  def getDiags(sideLength:Int):Array[Int] = {
    if(sideLength == 1) Array(1)
    else{
      val preDiags = getDiags(sideLength - 2)
      preDiags ++ Array.tabulate(4)(a => preDiags.last + (a + 1) * (sideLength - 1))
    }
  }
  def getRatio(sideLength:Int):Double = {
    val diags = getDiags(sideLength)
    val dPrimes = diags.intersect(primes)
    println((dPrimes.length, diags.length))
    dPrimes.length.toDouble / diags.length.toDouble
  }
  def result:Int = {
    for(i <- 20001 to Int.MaxValue by 2){
      if(getRatio(i) < 0.1) return i
    }
    0
  }
}
