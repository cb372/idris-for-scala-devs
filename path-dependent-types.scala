
case class Flight(id: String) {

  case class Seat(id: String)

  def seat(id: String) = Seat(id)

  def book(seat: Seat): Unit = 
    println(s"OK, booked seat ${seat.id}")

}

val outwardFlight = Flight("BA007")
val returnFlight  = Flight("BA008")

val outwardSeat = outwardFlight.seat("37A")
val returnSeat  = returnFlight.seat("37A")

println(outwardSeat == returnSeat) // false

outwardFlight.book(outwardSeat) // OK
//outwardFlight.book(returnSeat) // doesn't compile
