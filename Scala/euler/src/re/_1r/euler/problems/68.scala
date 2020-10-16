package re._1r.euler
package problems

object _68 {
  class Node(val value: Int, nxt: Node) {
    def next = nxt
    def <(n: Node) = value < n.value
    def ==(n: Node) = traverse == n.traverse
    override def toString: String = value.toString
    def traverse: Int = if(next != null) value + next.traverse else value
    def traverseString: String = if(next != null) toString + next.traverseString else toString
  }
  def result = (1 to 10).permutations.map(lst => (new Node(lst(0), new Node(lst(5), new Node(lst(6), null))), new Node(lst(1), new Node(lst(6), new Node(lst(7), null))), new Node(lst(2), new Node(lst(7), new Node(lst(8), null))), new Node(lst(3), new Node(lst(8), new Node(lst(9), null))), new Node(lst(4), new Node(lst(9), new Node(lst(5), null))))).toVector.filter(a => a._1 == a._2 && a._1 == a._3 && a._1 == a._4 && a._1 == a._5 && a._1 < a._2 && a._1 < a._3 && a._1 < a._4 && a._1 < a._5).map(a => (a._1.traverseString + a._2.traverseString + a._3.traverseString + a._4.traverseString + a._5.traverseString)).filter(_.length == 16).maxBy(BigInt(_))
}

