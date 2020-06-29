package re._1r.euler
package problems

import scala.io._
import java.io._

//exp

object _59{
  def result = {
    val tbyte = Source.fromFile("euler/resources/cypher.txt").mkString.split(",").map(_.toByte)
    val byteArray = tbyte.sortBy(a => tbyte.filter(_ == a).length)
    val i = 101
    val j = 120
    val k = 112
    tbyte.zipWithIndex.foldLeft(0)((acc, v) => {
      if(v._2 % 3 == 0) acc + (v._1^i)
        else if(v._2 % 3 == 1) acc + (v._1^j)
        else acc + (v._1^k)
    })
  }
}
