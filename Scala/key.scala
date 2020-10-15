import java.awt.Robot
import java.awt.event.KeyEvent

object keyPress extends App {
  def keyStroke = {
    val robot = new Robot()
    val str = Vector.tabulate(util.Random.nextInt(40))(x => util.Random.nextInt(26) + 65)
    str.foreach(chr => {
      robot.keyPress(chr)
      robot.keyRelease(chr)
    })
    robot.keyPress(KeyEvent.VK_ENTER)
    robot.keyRelease(KeyEvent.VK_ENTER)
  }
  val now = java.lang.System.currentTimeMillis
  while(java.lang.System.currentTimeMillis < now + 600000){
    if(java.lang.System.currentTimeMillis % 50 > 10) keyStroke
  }
}