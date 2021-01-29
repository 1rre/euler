package re._1r.euler
package problems

import utils.NumberOps._

object _53{
  def result: Int = {
    var rtn = 0
    for(i <- 23 to 100; j <- 4 to i - 4){
      if((i choose j) > 1000000) rtn += 1
    }
    rtn
  }
}
