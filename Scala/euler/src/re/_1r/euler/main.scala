package re._1r.euler
import problems._
import scala.compat.Platform.currentTime

<<<<<<< HEAD
object Main extends App{
	val now = currentTime
	val result = _68.result
	val nownow = currentTime
	println(s"$result\ntook: ${nownow - now}")
=======
object main extends App {
	val start = java.lang.System.currentTimeMillis
	val result = Euler88.result
	val fin = java.lang.System.currentTimeMillis
	println(result + "\ntook: " + (fin - start).toDouble / 1000)
>>>>>>> 586e1ba890d950595e7b542f79e1b28444ce88f1
}