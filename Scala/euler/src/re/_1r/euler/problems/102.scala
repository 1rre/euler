package re._1r.euler
package problems

object Euler102 {
  def mxc(a: (Double, Double), b: (Double, Double)) = {
    val m = (a._2 - b._2) / (a._1 - b._1)
    x: Double => m * x + a._2 - m * a._1
  }
  def below(l: Double => Double) = l(0) < 0
  def triangle(a: (Double, Double), b: (Double, Double), c: (Double, Double)) = {
    def within(ab: Double => Double, ac: Double => Double, bc: Double => Double) = {
      val cab = math.signum(a._1) != math.signum(b._1)
      val cac = math.signum(a._1) != math.signum(c._1)
      val cbc = math.signum(b._1) != math.signum(c._1)
      val bab = below(ab)
      val bac = below(ac)
      val bbc = below(bc)
      cab && cac && (bab ^ bac) || cab && cbc && (bab ^ bbc) || cac && cbc && (bac ^ bbc)
    }
    within(mxc(a, b), mxc(a, c), mxc(b, c))
  }
  def result = {
    val triangles = scala.io.Source.fromFile("triangles.txt").getLines.map(_.split(",")).map(_.grouped(2).map(n => (n(0).toDouble, n(1).toDouble)))
    triangles.count(tri => triangle(tri.next, tri.next, tri.next))
  }
}

