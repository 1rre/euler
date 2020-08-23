package re._1r.euler.utils

object Primes{
	def genPrimes(max: Int): Array[Int] = {
		def k = ((max - 2) / 2)
		val primes = Array.tabulate(k)(x => x + 1)
		for(i <- 1 to k; j <- i to (k - i) / (1 + 2 * i)){
			primes(i + j + 2 * i * j - 1) = 0
		}
		2 +: primes.filterNot(_ == 0).map(_ * 2 + 1)
	}
}
