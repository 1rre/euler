package re._1r.euler
package problems

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.Future
import scala.util.control.Exception._
import scala.util.Success

object _52{
  def result:Int = {
    val start = java.lang.System.nanoTime
    val f1 = Future[Int] {
      for(i <- 1 to Int.MaxValue by 8 if (i * 6).toString.charAt(0) >= '6'){
        def i_ = Seq(
          i.toString.sorted,
          (i * 2).toString.sorted,
          (i * 3).toString.sorted,
          (i * 4).toString.sorted,
          (i * 5).toString.sorted,
          (i * 6).toString.sorted
        )
        if(i_.forall(_ == i_.head)) println(i)
      }
      throw(new Exception)
      0
    }
    val f2 = Future[Int] {
      for(i <- 2 to Int.MaxValue by 8 if (i * 6).toString.charAt(0) >= '6'){
        def i_ = Seq(
          i.toString.sorted,
          (i * 2).toString.sorted,
          (i * 3).toString.sorted,
          (i * 4).toString.sorted,
          (i * 5).toString.sorted,
          (i * 6).toString.sorted
        )
        if(i_.forall(_ == i_.head)) println(i)
      }
      throw(new Exception)
      0
    }
    val f3 = Future[Int] {
      for(i <- 3 to Int.MaxValue by 8 if (i * 6).toString.charAt(0) >= '6'){
        def i_ = Seq(
          i.toString.sorted,
          (i * 2).toString.sorted,
          (i * 3).toString.sorted,
          (i * 4).toString.sorted,
          (i * 5).toString.sorted,
          (i * 6).toString.sorted
        )
        if(i_.forall(_ == i_.head)) println(i)
      }
      throw(new Exception)
      0
    }
    val f4 = Future[Int] {
      for(i <- 4 to Int.MaxValue by 8 if (i * 6).toString.charAt(0) >= '6'){
        def i_ = Seq(
          i.toString.sorted,
          (i * 2).toString.sorted,
          (i * 3).toString.sorted,
          (i * 4).toString.sorted,
          (i * 5).toString.sorted,
          (i * 6).toString.sorted
        )
        if(i_.forall(_ == i_.head)) println(i)
      }
      throw(new Exception)
      0
    }
    val f5 = Future[Int] {
      for(i <- 5 to Int.MaxValue by 8 if (i * 6).toString.charAt(0) >= '6'){
        def i_ = Seq(
          i.toString.sorted,
          (i * 2).toString.sorted,
          (i * 3).toString.sorted,
          (i * 4).toString.sorted,
          (i * 5).toString.sorted,
          (i * 6).toString.sorted
        )
        if(i_.forall(_ == i_.head)) println(i)
      }
      throw(new Exception)
      0
    }
    val f6 = Future[Int] {
      for(i <- 6 to Int.MaxValue by 8 if (i * 6).toString.charAt(0) >= '6'){
        def i_ = Seq(
          i.toString.sorted,
          (i * 2).toString.sorted,
          (i * 3).toString.sorted,
          (i * 4).toString.sorted,
          (i * 5).toString.sorted,
          (i * 6).toString.sorted
        )
        if(i_.forall(_ == i_.head)) println(i)
      }
      throw(new Exception)
      0
    }
    val f7 = Future[Int] {
      for(i <- 7 to Int.MaxValue by 8 if (i * 6).toString.charAt(0) >= '6'){
        def i_ = Seq(
          i.toString.sorted,
          (i * 2).toString.sorted,
          (i * 3).toString.sorted,
          (i * 4).toString.sorted,
          (i * 5).toString.sorted,
          (i * 6).toString.sorted
        )
        if(i_.forall(_ == i_.head)) println(i)
      }
      throw(new Exception)
      0
    }
    val f8 = Future[Int] {
      for(i <- 8 to Int.MaxValue by 8 if (i * 6).toString.charAt(0) >= '6'){
        def i_ = Seq(
          i.toString.sorted,
          (i * 2).toString.sorted,
          (i * 3).toString.sorted,
          (i * 4).toString.sorted,
          (i * 5).toString.sorted,
          (i * 6).toString.sorted
        )
        if(i_.forall(_ == i_.head)) println(i)
      }
      throw(new Exception)
      0
    }
    while(!(f1.isCompleted && f2.isCompleted && f3.isCompleted && f4.isCompleted && f5.isCompleted && f6.isCompleted && f7.isCompleted && f8.isCompleted)){}
    0
  }
}
