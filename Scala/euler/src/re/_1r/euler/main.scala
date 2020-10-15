package re._1r.euler
import problems._
import scala.compat.Platform.currentTime

object Main extends App{
	val now = currentTime
	val result = Euler90.result
	val nownow = currentTime
	println(s"$result\ntook: ${nownow - now}")
}