package re._1r.euler
package problems

import math._
import utils.InfiniteRootSum

object _66 {
  def rSolve(x: Int, n: Int): BigInt = {
    0
  }
  def result = {
    val x = 
    (1 to 10).foldLeft(new InfiniteRootSum(61))((acc, _) =>{
      println((acc.numer, acc.denom))
      acc.next
    })
    //(1 to 100).filterNot(sqrt(_).isValidInt).map(rSolve(_, 1, 1))
  }
}