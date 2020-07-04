package re._1r.euler.utils

import scala.language.postfixOps
import scala.math._

class Fraction(val numer: BigInt, val denom: BigInt) {
  def +(i: BigInt) = new Fraction(numer + i * denom, denom)
  def /(f: Fraction) = new Fraction(numer * f.denom, denom * f.numer)
  def apply: Double = numer.toDouble / denom.toDouble
  override def toString(): String = numer.toString + "/" + denom.toString
}

class InfiniteRootSum(val int: Int, val root: Int, val numer: Int, val denom: Int) {
  def this(rt: Int) = this(sqrt(rt).toInt, rt, -sqrt(rt).toInt, 1)
  def next: InfiniteRootSum = {
    val iNext = (denom / (sqrt(root) + numer)).toInt
    val dNext = (root - pow(numer, 2).toInt) / denom
    val nNext = - numer - iNext * dNext
    new InfiniteRootSum(iNext, root, nNext, dNext)
  }
}

object NumberOps{
  implicit class doubleOps(d: Double){
    def ^(power: Double) = pow(d, power)
    def log(b: Double) = math.log(d) / math.log(b)
  }
  implicit class intOps(i: Int){
    def !(): BigInt = if (i == 0) 1 else (i * ((i - 1)!))
    def choose(j: Int): BigInt = (i!) / ((j!) * ((i - j)!))
    def ^^(power: Int) = BigInt(i).pow(power)
    def shape(n: Int) = {
      i * (i * (n - 2) - (n - 4)) / 2
    }
    def isShape(n: Int) = {
      (i == 0 || i == 1 || i > 1 && isShapeR(0, i, i, n))
    }
    def isShapeR(a: Int, b: Int, i: Int, n: Int): Boolean = {
      if (b - a == 1) false
      else {
        val x = ((a + b) / 2).shape(n)
        if(x==i) true
        else if(x > i) isShapeR(a, (a + b) / 2, i, n)
        else isShapeR((a + b) / 2, b, i, n)
      }
    }
  }
  implicit class bigIntOps(i: BigInt){
    def isPalindrome: Boolean = i.toString == i.toString.reverse
    def digitSum: Int = i.toString.foldLeft(0)((acc, v) => acc + v.toInt)
    def powerPerms = i.toString.permutations.filter(a => a != i.toString && a(0) != '0' && BigInt(a).isPower(3))
    def ^^(n: Int) = i.pow(n)
    def isPower(n: Int) = {
      n match {
        case 0 => i == 0
        case 1 => true
        case 2 => sqrt(i.toDouble).isValidInt
        case 3 => cbrt(i.toDouble).isValidInt
        case _ => i.toDouble.log(n.toDouble).isValidInt
      }
    }
  }
}
