package re._1r.euler
package problems

object Euler90 {
  def squares = Array(1, 4, 9, 16, 25, 36, 49, 64, 81)
  def find(c0: Array[Int], c1: Array[Int]): Boolean = {
    (c0.contains(0) && c1.contains(1) || c0.contains(1) && c1.contains(0)) &&                                          //1
    (c0.contains(0) && c1.contains(4) || c0.contains(4) && c1.contains(0)) &&                                          //4
    (c0.contains(0) && (c1.contains(6) || c1.contains(9)) || (c0.contains(6) || c0.contains(9)) && c1.contains(0)) &&  //9
    (c0.contains(1) && (c1.contains(6) || c1.contains(9)) || (c0.contains(6) || c0.contains(9)) && c1.contains(1))    //16
    (c0.contains(5) && c1.contains(2) || c0.contains(2) && c1.contains(5)) &&                                         //25
    (c0.contains(3) && (c1.contains(6) || c1.contains(9)) || (c0.contains(6) || c0.contains(9)) && c1.contains(3)) && //36
    (c0.contains(4) && (c1.contains(6) || c1.contains(9)) || (c0.contains(6) || c0.contains(9)) && c1.contains(4)) && //49
    (c0.contains(4) && (c1.contains(6) || c1.contains(9)) || (c0.contains(6) || c0.contains(9)) && c1.contains(4)) && //64
    (c0.contains(8) && c1.contains(1) || c0.contains(1) && c1.contains(8))                                            //81
  }

  def result = {
    var rtn = collection.mutable.ArrayBuffer[Array[Array[Int]]]()
    for(
      c00 <- 0 to 9;
      c01 <- c00 + 1 to 9;
      c02 <- c01 + 1 to 9;
      c03 <- c02 + 1 to 9;
      c04 <- c03 + 1 to 9;
      c05 <- c04 + 1 to 9
    ) {
      def c0 = Array(c00, c01, c02, c03, c04, c05)
      for(
        c00 <- 0 to 9;
        c01 <- c00 + 1 to 9;
        c02 <- c01 + 1 to 9;
        c03 <- c02 + 1 to 9;
        c04 <- c03 + 1 to 9;
        c05 <- c04 + 1 to 9
      ) {
        def c1 = Array(c00, c01, c02, c03, c04, c05)
        if(find(c0, c1) && c0 != c1) rtn += Array(c0, c1).sortBy(_.sum)
      }
    }
    rtn.distinct.size
  }
}