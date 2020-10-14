package re._1r.euler
package problems

object Euler78 {
  val pMap = collection.mutable.HashMap[Int, Int]((0 -> 1), (1 -> 1))
  def partition(n: Int) = {
    println(s"${n}:")
    (0 to n / 2).map(i => {
      println(i)
      pMap(i)
    })
  }
  def result = {
    (1 to 5).foreach(i => {
      val x = partition(i).sum
      println(x)
      pMap.put(i, x)
    })
  }
}