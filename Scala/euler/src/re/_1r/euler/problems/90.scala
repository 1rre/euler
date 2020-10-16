package re._1r.euler
package problems

object Euler90 {
  val squares = (1 to 9).map(x => (100 + x * x).toString.toCharArray.tail)
  val dn = collection.mutable.ArrayBuffer[Array[Array[Char]]]()
  def arrangements(c0: Array[Char], c1: Array[Char]) = {
    squares.forall(chr => {
      (c0.contains(chr(0)) || chr(0) == '9' && c0.contains('6')) &&
      (c1.contains(chr(1)) || chr(1) == '9' && c1.contains('6')) ||
      (c0.contains(chr(1)) || chr(1) == '9' && c0.contains('6')) &&
      (c1.contains(chr(0)) || chr(0) == '9' && c1.contains('6'))
    })
  }
  def result = {
    var rtn = 0
    val c00 = 0
    for(c01 <- 1 until 9; c02 <- c01 + 1 until 9; c03 <- c02 + 1 until 9; c04 <- c03 + 1 until 9; c05 <- c04 + 1 until 9) {
      val c0 = Array(c00.toString.apply(0), c01.toString.apply(0), c02.toString.apply(0), c03.toString.apply(0), c04.toString.apply(0), c05.toString.apply(0))
      for(c10 <- 0 until 9; c11 <- c10 + 1 until 9; c12 <- c11 + 1 until 9; c13 <- c12 + 1 until 9; c14 <- c13 + 1 until 9; c15 <- c14 + 1 until 9) {
        val c1 = Array(c10.toString.apply(0), c11.toString.apply(0), c12.toString.apply(0), c13.toString.apply(0), c14.toString.apply(0), c15.toString.apply(0))
        if (arrangements(c1, c0) && dn.forall(x => {
          !(x.contains(c1) && x.contains(c0))
        })) {
          rtn += 1
          dn += Array(c0, c1)
        }
      }
    }
    rtn
  }
}