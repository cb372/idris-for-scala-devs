
object PatternMatching extends App {
  sealed trait State
  case object Sleeping extends State
  case object Hiking extends State
  case object Scalaing extends State

  case class Attendee(state: State, caption: String)

  val sleepingAttendee = new Attendee(Sleeping, "Zzzz")

  def goToBed(attendee: Attendee): Either[String, Attendee] = {
    attendee.state match {
      case Sleeping => Left("Attendee is already asleep!")
      case Hiking | Scalaing => Right(Attendee(Sleeping, "Goodnight!"))
    }
  }

  def startScalaing(attendee: Attendee): Either[String, Attendee] = {
    attendee.state match {
      case Scalaing => Left("Attendee is already Scala-ing!")
      case Hiking | Sleeping => Right(Attendee(Scalaing, "I love types!"))
    }
  }

  println(goToBed(sleepingAttendee))
  println(startScalaing(sleepingAttendee))
}

