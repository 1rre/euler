package re._1r.euler
package problems

object Euler84 {
def total = Board.map(_.frequency).sum.toDouble
class Square(val sqType: Char, position: Int) {
  var frequency = 0
  def chance = frequency / total * 100
  def next = Board((position + 1) % 40)
  def last = Board((position + 39) % 40)
  def find(target: Char): Square = {
    if(next.sqType == target) next
    else next.find(target)
  }
  def move(roll: Int) = {
    Board((position + roll) % 40) match {
      case sq if sq.sqType == 'J' | (position + roll) % 40 == 30 => Board(10) //Go to Jail
      case sq if sq.sqType == 'C' => { //Community Chest
        util.Random.between(0, 16) match {
          case 0 => Board(0) //Go
          case 1 => Board(10) //Jail
          case _ => sq
        }
      }
      case sq if sq.sqType == 'c' => { //Chance
        util.Random.between(0, 16) match {
          case 0 => Board(0) //GO
          case 1 => Board(10) //Jail
          case 2 => Board(11) //C1
          case 3 => Board(24) //E3
          case 4 => Board(39) //H2
          case 5 => Board(5) //R1
          case 6 | 7 => sq.find('r') //Next Railway
          case 8 => sq.find('u') //Next Utility
          case 9 => Board((position + 37) % 40)
          case _ => sq
        }
      }
      case sq => sq
    }
  }
  override def toString: String = sqType.toString + position.toString + ": " + chance.toString + "%"
}
val Board = Vector.tabulate(40)(i => {
  i match {
    case 0 => new Square('g', i) //Go
    case 10 => new Square('j', i) //Jail
    case 20 => new Square('f', i) //Free Parking
    case 30 => new Square('J', i) //Go to Jail
    case 4 | 38 => new Square('t', i) //Tax
    case 12 | 28 => new Square('u', i) //Utility
    case 2 | 17 | 33 => new Square('C', i) //Community Chest
    case 7 | 22 | 36 => new Square('c', i) //Chance
    case 5 | 15 | 25 | 35 => new Square('r', i) //Railway
    case _ => new Square('p', i) //Property
  }
})
import collection.mutable.ArrayBuffer
var visited: ArrayBuffer[Square] = ArrayBuffer.tabulate(40)(x => if(x != 30) Board(x) else Board(10))
var lastGo = 1
def run = {
  visited.foreach(sq => {
    (1 to 4).foreach(i => {
      (1 to 4).foreach(j => {
        visited += sq.move(i + j)
        visited.last.frequency += 1
      })
    })
  })
}
def result = {
  run
  println(visited.length)
  for(i <- 0 to 3) {
    visited = visited.drop(lastGo)
    lastGo = visited.length
    run
    println(i + ", " + visited.length)
  }
  Board.sortBy(_.chance).reverse.mkString(", ")
}
}



