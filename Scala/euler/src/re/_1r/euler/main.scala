package re._1r.euler
import problems._

object main extends App {
	val start = java.lang.System.currentTimeMillis
	val result = E103.result
	val fin = java.lang.System.currentTimeMillis
	println(result + "\ntook: " + (fin - start).toDouble / 1000)
}