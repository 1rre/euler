package re._1r.euler
package problems


import utils.Primes._
object Euler72 {
  def max = 25000
  def result = {
    //5, 2 | 3, 2 | 4, 1 | 5, 1 | 5, 3 | 7, 3
    import concurrent._
    import ExecutionContext.Implicits.global
    val f = Array(
      Future {
        var cnt = 0
        def genCoprime(m: Int, n: Int): Unit = {
          if (2 * m + n <= max) {
            cnt += 1
            genCoprime(2 * m + n, m)
          }
          if (2 * m - n <= max) {
            cnt += 1
            genCoprime(2 * m - n, m)
          }
          if (m + 2 * n <= max) {
            cnt += 1
            genCoprime(m + 2 * n, n)
          }
        }
        genCoprime(5, 2)
        cnt
      },
      Future {
        var cnt = 0
        def genCoprime(m: Int, n: Int): Unit = {
          if (2 * m + n <= max) {
            cnt += 1
            genCoprime(2 * m + n, m)
          }
          if (2 * m - n <= max) {
            cnt += 1
            genCoprime(2 * m - n, m)
          }
          if (m + 2 * n <= max) {
            cnt += 1
            genCoprime(m + 2 * n, n)
          }
        }
        genCoprime(3, 2)
        cnt
      },
      Future {
        var cnt = 0
        def genCoprime(m: Int, n: Int): Unit = {
          if (2 * m + n <= max) {
            cnt += 1
            genCoprime(2 * m + n, m)
          }
          if (2 * m - n <= max) {
            cnt += 1
            genCoprime(2 * m - n, m)
          }
          if (m + 2 * n <= max) {
            cnt += 1
            genCoprime(m + 2 * n, n)
          }
        }
        genCoprime(4, 1)
        cnt
      },
      Future {
        var cnt = 0
        def genCoprime(m: Int, n: Int): Unit = {
          if (2 * m + n <= max) {
            cnt += 1
            genCoprime(2 * m + n, m)
          }
          if (2 * m - n <= max) {
            cnt += 1
            genCoprime(2 * m - n, m)
          }
          if (m + 2 * n <= max) {
            cnt += 1
            genCoprime(m + 2 * n, n)
          }
        }
        genCoprime(5, 1)
        cnt
      },
      Future {
        var cnt = 0
        def genCoprime(m: Int, n: Int): Unit = {
          if (2 * m + n <= max) {
            cnt += 1
            genCoprime(2 * m + n, m)
          }
          if (2 * m - n <= max) {
            cnt += 1
            genCoprime(2 * m - n, m)
          }
          if (m + 2 * n <= max) {
            cnt += 1
            genCoprime(m + 2 * n, n)
          }
        }
        genCoprime(5, 3)
        cnt
      },
      Future {
        var cnt = 0
        def genCoprime(m: Int, n: Int): Unit = {
          if (2 * m + n <= max) {
            cnt += 1
            genCoprime(2 * m + n, m)
          }
          if (2 * m - n <= max) {
            cnt += 1
            genCoprime(2 * m - n, m)
          }
          if (m + 2 * n <= max) {
            cnt += 1
            genCoprime(m + 2 * n, n)
          }
        }
        genCoprime(7, 3)
        cnt
      }
    )
    while (f.exists(!_.isCompleted)) {}
    f.map(_.value.get.get).sum + 8
  }
}