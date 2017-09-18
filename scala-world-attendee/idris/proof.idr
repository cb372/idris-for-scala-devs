data State = Sleeping | Hiking | Scalaing

data Valid : (from : State) -> (to : State) -> Type where
  WakeUp : Valid Sleeping Scalaing 
  GoToBed : Valid Scalaing Sleeping
  StartHiking : Valid Scalaing Hiking

data Attendee : (s : State) -> Type where
  MkAttendee : (s: State) -> (caption : String) -> Attendee s

sleepingAttendee : Attendee Sleeping
sleepingAttendee = MkAttendee Sleeping "Zzzzz"

goToBed : Attendee s -> { auto prf: Valid s Sleeping } -> Attendee Sleeping
goToBed _ = MkAttendee Sleeping "Goodnight!"

startScalaing : Attendee s -> { auto prf: Valid s Scalaing } -> Attendee Scalaing
startScalaing _ = MkAttendee Scalaing "I love types!"
