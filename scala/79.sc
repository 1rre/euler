import collection.mutable.HashMap
object Euler79 {
  val file = io.Source.fromFile("keylog.txt").getLines.map(_.toVector).toVector
  println(file.foldLeft(file.foldLeft(HashMap[Char, Int]())((acc, v) => {
    v.foreach(chr => v.count(_ == chr) match {
        case n if n > acc.getOrElseUpdate(chr, n) => acc(chr) = n
        case _ =>
      })
    acc
  }).foldLeft(Vector[Char]())((acc, v) => acc ++ Vector.fill(v._2)(v._1)).permutations.toVector)((acc, v) => acc.filter(nums => nums.indexOf(v(2)) > nums.indexOf(v(1)) && nums.indexOf(v(1)) > nums.indexOf(v(0)))).mkString)
}