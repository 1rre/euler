import collection.mutable.HashMap

object Euler78 extends App {
  def max = 5
  val map = HashMap[Int, Int](1 -> 1)
  (1 to max).foreach(i => {
    (1 to i / 2).foreach(j => {
      map(i) = map.getOrElse(i, 0) + map.getOrElse(j, 0) + map.getOrElse(i - j, 0)
    })
  })
  println(map)
}