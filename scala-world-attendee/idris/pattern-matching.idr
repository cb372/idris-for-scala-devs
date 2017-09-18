
data State = Sleeping | Hiking | Scalaing

data Attendee = MkAttendee State String

sleepingAttendee : Attendee
sleepingAttendee = MkAttendee Sleeping "Zzzzz"

goToBed : Attendee -> Either String Attendee
goToBed (MkAttendee Sleeping _) = Left "Attendee is already asleep!"
goToBed _ = Right(MkAttendee Sleeping "Goodnight!")

startScalaing : Attendee -> Either String Attendee
startScalaing (MkAttendee Scalaing _) = Left "Attendee is already Scala-ing!"
startScalaing _ = Right(MkAttendee Scalaing "I love types!")
