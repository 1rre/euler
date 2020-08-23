package re._1r.euler
package problems

import scala.io._
import scala.util.Sorting
import scala.math.Ordering

object _54{
  case class Card(number: Int, suit: Char)
  object Card{
    implicit def ordering[A <: Card]: Ordering[A] = Ordering.by(_.number)
  }
  class Hand(val cards: Array[Card]){
    def dominantCards:Array[Card] = handType match{
      case 0 => cards
      case 1 => activeHand(0) +: cards.filterNot(c => activeHand.exists(_ == c))
      case 2 => Array(activeHand(0), activeHand(2)) ++ cards.filterNot(c => activeHand.exists(_ == c))
      case 3 => activeHand(0) +: cards.filterNot(c => activeHand.exists(_ == c))
      case 5 => cards
      case 6 => Array(cards.groupBy(_.number).maxBy(_._2.size)._2(0))
      case 7 => activeHand(0) +: cards.filterNot(c => activeHand.exists(_ == c))
      case _ => Array(cards(0)) //Straight, SFlush, RFlush
    }
    def activeHand:Array[Card] = handType match{
      case 0 => cards
      case 1 => cards.groupBy(_.number).maxBy(_._2.size)._2
      case 2 => cards.groupBy(_.number).filter(_._2.size == 2).foldLeft(Array[Card]())((acc, v) => acc ++ v._2)
      case 3 => cards.groupBy(_.number).maxBy(_._2.size)._2
      case 7 => cards.groupBy(_.number).maxBy(_._2.size)._2
      case _ => cards
    }
    def handType: Int = {
      def pair = cards.groupBy(_.number).size == 4
      def pair2 = cards.groupBy(_.number).maxBy(_._2.size)._2.size == 2 && cards.groupBy(_.number).size == 3
      def kind3 = cards.groupBy(_.number).maxBy(_._2.size)._2.size == 3 && cards.groupBy(_.number).size == 3
      def straight = cards.zipWithIndex.init.forall(c => c._1.number - 1 == cards(c._2 + 1).number)
      def flush = cards.forall(_.suit == cards.head.suit)
      def fullHouse = (cards.groupBy(_.number).maxBy(_._2.size)._2.size == 3) && cards.groupBy(_.number).size == 2
      def kind4 = cards.groupBy(_.number).maxBy(_._2.size)._2.size == 4
      def straightFlush = straight && flush && cards(0).number < 10
      def royalFlush = straight && flush && cards(0).number == 10
      if(pair) 1 else if(pair2) 2 else if(kind3) 3 else if(straight) 4 else if(flush) 5 else if(fullHouse) 6
        else if(kind4) 7 else if(straightFlush) 8 else if(royalFlush) 9 else 0
    }
  }
  object Hand{
    implicit def ordering[A <: Hand]: Ordering[A] = new Ordering[A]{
      def compare(x: A, y: A): Int = {
        if(x.handType != y.handType) x.handType compare y.handType
        else if(x.dominantCards(0).number != y.dominantCards(0).number){
          x.dominantCards(0).number compare y.dominantCards(0).number
        }
        else if(x.dominantCards.length > 1 && x.dominantCards(1).number != y.dominantCards(1).number){
          x.dominantCards(1).number compare y.dominantCards(1).number
        }
        else if(x.dominantCards.length > 2 && x.dominantCards(2).number != y.dominantCards(2).number){
          x.dominantCards(2).number compare y.dominantCards(2).number
        }
        else if(x.dominantCards.length > 3 && x.dominantCards(3).number != y.dominantCards(3).number){
          x.dominantCards(3).number compare y.dominantCards(3).number
        }
        else if(x.dominantCards.length > 4){
          x.dominantCards(4).number compare y.dominantCards(4).number
        }
        else 0 compare 0
      }
    }
  }
  class Player{
    var hand: Hand = new Hand(Array())
    var wins = 0
  }
  def parseHand(rawHand: Array[String]) = new Hand(Array(
    parseCard(rawHand(0)),
    parseCard(rawHand(1)),
    parseCard(rawHand(2)),
    parseCard(rawHand(3)),
    parseCard(rawHand(4))
  ).sorted.reverse)
  def parseCard(rawCard: String) : Card = {
    new Card(rawCard.charAt(0) match {
      case 'T' => 10
      case 'J' => 11
      case 'Q' => 12
      case 'K' => 13
      case 'A' => 14
      case num => num.toString.toInt
    }, rawCard.charAt(1))
  }
  def result:Int = {
    val fileSource = Source.fromFile("resources\\poker.txt")
    val inHands = fileSource.getLines.toArray.map(_.split(" ").splitAt(5))
    fileSource.close
    val start = java.lang.System.currentTimeMillis
    val player_1 = new Player
    val player_2 = new Player
    inHands.foreach(hand => {
      player_1.hand = parseHand(hand._1)
      player_2.hand = parseHand(hand._2)
      if(Hand.ordering.gt(player_1.hand, player_2.hand)){
        player_1.wins += 1
      }
    })
    player_1.wins
  }
}
