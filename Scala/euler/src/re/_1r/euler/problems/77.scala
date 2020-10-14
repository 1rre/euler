package re._1r.euler
package problems

import utils.Primes._

object Euler77 {
  val primes = genPrimes(10)
  val ways: Vector[Vector[Vector[Int]]] = Vector()
  def target = 5000
  def result = {
    (2 to 10).foldLeft(ways)((vec, i) => {
      //if(vec.size > 0 && vec.last.size > target) return i - 1
      vec :+ primes.takeWhile(_ <= i).foldLeft(Vector[Vector[Int]]())((acc, j) => 
        if(i == j) (acc :+ Vector(i)).asInstanceOf[Vector[Vector[Int]]]
        else if(i - j - 2 >= 0) (acc ++ vec(i - j - 2).map(x => (x :+ (j)).sorted)).distinct.asInstanceOf[Vector[Vector[Int]]]
        else acc
      )
    }).mkString("\n")
    //0
  }
}