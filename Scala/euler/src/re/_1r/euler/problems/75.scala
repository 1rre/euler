/*import scala.math.BigInt
object main extends App {
  implicit class fact(n: Int) {
    def ! :BigInt = if(n == 0) 1 else n * ((n - 1)!)
    def c(r: Int) = (n!) / ((r!) * ((n - r)!))
  }
  val x = 10
  def result = (1 until x).foldLeft(BigInt(0))((acc, v) => acc + (x c v) / x)
  println(result)
}*/