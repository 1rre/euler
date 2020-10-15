package re._1r.euler.utils

import scala.language.postfixOps

object NumberOps{
  implicit class doubleOps(d: Double){
    def ^(power: Double) = math.pow(d, power)
  }
  implicit class intOps(i: Int){
    def !(): math.BigInt = if (i == 0) 1 else (i * ((i - 1)!))
    def choose(j: Int): math.BigInt = (i!) / ((j!) * ((i - j)!))
    def ^^(power: Int) = math.BigInt(i).pow(power)
  }
  implicit class bigIntOps(i: math.BigInt){
    def isPalindrome: Boolean = i.toString == i.toString.reverse
    def digitSum: Int = i.toString.foldLeft(0)((acc, v) => acc + v.toInt)
  }
}
