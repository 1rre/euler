package re._1r.euler
package problems

import utils._

object _51{ //3 replaced digits, ends in 1, 3, 7, 9, replaced 0, 1 or 2 must be prime
  val primes:Array[Int] = Primes.genPrimes(1000000)
  def result:Int = {
    primes.filter(_ > 100000).foreach({ i =>
      def numLength = i.toString.length
      for(r_0 <- 0 until numLength - 3;
        r_1 <- r_0 + 1 until numLength - 2;
        r_2 <- r_1 + 1 until numLength - 1){
        for(r_v <- 0 to 2 if(!(r_v == 0 && r_0 == 0))){
          val num_r = i.toString.zipWithIndex.map(digit => { //replace digits
            if(digit._2 == r_0 || digit._2 == r_1 || digit._2 == r_2){
              r_v.toString.charAt(0)
            }
            else digit._1
          }).mkString.toInt
          if(primes.exists(_ == num_r)){ //num_r is prime
            if((r_v + 1 to 9).foldLeft(1)((acc, v) => {
              val prm = i.toString.zipWithIndex.map(digit => { //replace digits
                if(digit._2 == r_0 || digit._2 == r_1 || digit._2 == r_2){
                  v.toString.charAt(0)
                }
                else digit._1
              }).mkString.toInt
              if(primes.exists(_ == prm)) acc + 1 else acc
            }) == 8) return num_r
          }
        }
      }
    })
    0
  }
}
