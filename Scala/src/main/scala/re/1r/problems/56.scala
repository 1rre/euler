package re._1r.euler
package problems

import utils.NumberOps._

object _56{
  def result = {
    Array.tabulate(100,100)((i,j) => (i^^j).toString.foldLeft(0)((acc, v) => acc + v.toString.toInt)).maxBy(_.max).max
  }
}
