
object PhantomTypes extends App {
  sealed trait State
  sealed trait Sleeping extends State
  sealed trait Hiking extends State
  sealed trait Scalaing extends State

  @scala.annotation.implicitNotFound("That's not a valid state transition")
  trait Valid[From, To]
  implicit val sleepingToScalaing: Valid[Sleeping, Scalaing] = null
  implicit val scalaingToHiking: Valid[Scalaing, Hiking] = null

  case class Attendee[S <: State](caption: String)

  val sleepingAttendee = new Attendee[Sleeping]("Zzzz")

  def goToBed[S <: State](attendee: Attendee[S])
                         (implicit valid: Valid[S, Sleeping]) = 
    Attendee[Scalaing]("Goodnight!")

  def startScalaing[S <: State](attendee: Attendee[S])
                               (implicit valid: Valid[S, Scalaing]) = 
    Attendee[Scalaing]("I love types!")

  //println(goToBed(sleepingAttendee)) // doesn't compile
  println(startScalaing(sleepingAttendee))
}
