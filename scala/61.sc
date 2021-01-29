package re._1r.euler
package problems

import utils.NumberOps._

object _61 {
  val shapes = Seq(
    Array.tabulate(96)(a => (a + 45).shape(3)).filter(_ % 100 > 9),
    Array.tabulate(68)(a => (a + 32).shape(4)).filter(_ % 100 > 9),
    Array.tabulate(56)(a => (a + 26).shape(5)).filter(_ % 100 > 9),
    Array.tabulate(48)(a => (a + 23).shape(6)).filter(_ % 100 > 9),
    Array.tabulate(43)(a => (a + 21).shape(7)).filter(_ % 100 > 9),
    Array.tabulate(40)(a => (a + 19).shape(8)).filter(_ % 100 > 9)
  )
  def result: Int = {
    shapes(5).foreach(i_1 => {
      val str = "Oct: " + i_1 + ", "
      shapes(4).foreach(i_2 => {
        println(str + "Hept: " + i_2)
        shapes(3).foreach(i_3 => {
          shapes(2).foreach(i_4 => {
            shapes(1).foreach(i_5 => {
              shapes(0).foreach(i_6 => {
                val i: Array[Int] = Array(i_1, i_2, i_3, i_4, i_5, i_6)
                if(i.distinct.length == 6 && allInOrder(i)){
                  println((i(0),i(1),i(2),i(3),i(4),i(5)))
                  return(i.sum)
                }
              })
            })
          })
        })
      })
    })
    0
  }
  def allInOrder(i: Array[Int]): Boolean = {
    i.forall(a => {
      val i_1 = i.filterNot(_ == a)
      val mod = i_1.filter(b => b / 100 == a % 100 && b % 100 != a / 100)
      if(mod.length > 0) {
        val div = i_1.filter( b => b % 100 == a / 100 && b / 100 != a % 100)
        mod.length == div.length
      } else false
    })
  }
  def calcRange(i: Int) = {
    val iLast2 = i.toString.substring(2).toInt
    (iLast2 * 100) to ((iLast2 + 1) * 100 - 1)
  }
}