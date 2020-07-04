package re._1r.euler.problems

import math.BigInt

class Fraction(val numer: BigInt, val denom: BigInt) {
  def +(i: BigInt) = new Fraction(numer + i * denom, denom)
  def /(f: Fraction) = new Fraction(numer * f.denom, denom * f.numer)
  def apply: Double = numer.toDouble / denom.toDouble
  override def toString(): String = numer.toString + "/" + denom.toString
}

object _65 {
  def frac(depth: Int) = {
    depth match {
      case 0 => 2
      case x if (x + 1) % 3 == 0 => ((x + 1) / 3) * 2
      case _ => 1
    }
  }
  def findToDepth(x: Int) = {
    (0 to x - 2).foldRight(new Fraction(1, 1))((v, acc) => {
      (new Fraction(1, 1) / acc) + frac(v)
    })
  }
  def result = findToDepth(100).numer.toString.map(_.toString.toInt).sum
}