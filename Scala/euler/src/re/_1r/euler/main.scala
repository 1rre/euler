package re._1r.euler

import math.BigInt
import collection.mutable._
import concurrent.Future
import concurrent.ExecutionContext.Implicits.global

object Main extends App {
  implicit class IntDigits(x: BigInt) {
    def digits: Array[BigInt] = if(x < 10) Array(x) else (x / 10).digits :+ x % 10
    def persist: Int = if (x <= 10) 0 else 1 + x.digits.reduce((acc, v) => acc * v).persist
  }
  def threads = 8
  val cnt = Array.tabulate(threads)(i => BigInt(i) + 10)
  var max: (BigInt, Int) = (0, 0)
//  val start = java.lang.System.nanoTime
  (0 until threads).foreach(i => {
    Future(while(true) {
    cnt(i).persist match {
        case x if x > max._2 => max = (cnt(i), x)
        case _ =>
      }
      cnt(i) += threads
    })
  })
/*  val end = java.lang.System.nanoTime
  println(s"\ntook ${(end - start) / 1000000000d}")*/
  while(true) {
    Thread.sleep(1000)
    println(max)
  }
}



object Trash {
    val answers: Array3D = ArrayBuffer(ArrayBuffer(0,0,0,0,0,0,0,0,0,0))
  implicit class Array3D(x: ArrayBuffer[ArrayBuffer[Int]]) {
    def array = x
    def add(n: Int): Unit = util.Try(answers.array.last += n).getOrElse(answers.array += ArrayBuffer(n)) //if (answers.array.last.size == Int.MaxValue) answers.array += ArrayBuffer[Int](n) else answers.array.last += n
    def at(n: BigInt): Int = x((n / Int.MaxValue).toInt)((n % Int.MaxValue).toInt)
    def last = x.last.last
    def getMax = x.zipWithIndex.map(i => i._1.zipWithIndex.map(j => (j._1, j._2 + BigInt(i._2) * Int.MaxValue)).maxBy(_._1)).maxBy(_._1)
  }
  /*implicit class IntDigits(x: BigInt) {
    def digits: Array[BigInt] = if(x < 10) Array(x) else (x / 10).digits :+ x % 10
    def persist: Unit = answers.add(1 + answers.at(x.digits.reduce((acc, v) => acc * v)))
  }*/
}