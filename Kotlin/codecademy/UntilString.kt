/*
  codecademy kotlin free course
*/

fun main(){
  println("Coding is fun!")
  println("Just keep swimming!")
  print(15*4)

  // variable
  var todaysDate: String = "11/27/2021" // mutable
  println(todaysDate)

  var currentWeather: String // mutable
  currentWeather = "cold and windy"
  println(currentWeather)

  val pi: Double = 3.14 // immutable

  // type inference
  var typeTest = 6
  print("${typeTest::class.simpleName}")

  // String Concatenation
  val dog = "Toto"
  val state = "Kansas"
  val movie = "The Wizard of Oz"

  println(dog + ", I've a feeling we're not in " + state + " anymore. - " + movie + ", 1939")

  // String Templates
  val plant = "orchid"
  val potSize = 6 // in inches 
  val dayNum = 7 
  println("An $plant in a $potSize inch pot must be watered every $dayNum days.")

  // Userinput
  // kotlinc UserInput.kt -include-runtime -d UserInput.jar
  // java -jar UserInput.jar
  println("Please type your name and hit Enter.")
  var myName = readLine()
  println("Your name is $myName!")
}
