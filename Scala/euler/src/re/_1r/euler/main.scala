package re._1r.euler
import problems._
import scala.compat.Platform.currentTime

object main extends App {
	val start = java.lang.System.currentTimeMillis
	val result = E103.result
	val fin = java.lang.System.currentTimeMillis
	println(result + "\ntook: " + (fin - start).toDouble / 1000)
}