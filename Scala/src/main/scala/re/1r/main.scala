import math.BigInt
object _72 {
	def branch(top:BigInt, m: BigInt, n: BigInt): BigInt = {
		if(m <= top) {
			println(n.toString + "/" + m)
			1 + branch(top, 2 * m - n, m) + branch(top, 2 * m + n, m) + branch(top, m + 2 * n, n)
		} else 0
	}
    def result = {
		branch(1000000, 3, 1) + branch(1000000, 2, 1)
    }
}
object main extends App{
	println(_72.result)
}
