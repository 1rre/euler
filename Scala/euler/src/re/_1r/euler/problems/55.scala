package re._1r.euler
package problems

import utils.NumberOps._
import scala.util.control.Breaks

object _55 {
  def goUntilPalindromic(num: math.BigInt, depth:Int):Int = {
    val nextNum = num + math.BigInt(num.toString.reverse)
    if(depth > 50) 1
    else if(nextNum.isPalindrome) 0
    else goUntilPalindromic(nextNum, depth + 1)
  }
  def result:Int = {
    (1 to 10000).foldLeft(0)((acc, v) => acc + goUntilPalindromic(v,1))
  }
}
