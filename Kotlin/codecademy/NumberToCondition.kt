fun main() {

  val caesarSalad = 8.50
  val beefStroganoff = 18
  val cheesecake = 6

  var total = caesarSalad + beefStroganoff + cheesecake
  var tip = 0.15
  var finalAmount = (total * tip) + total
  println(finalAmount)

  //condition
  // if else
  var saleHappening = false
  var price: Int
  
  if (saleHappening){
    price = 12
  } else {
    price = 15
  }
  println("The total is $price dollars.")

  var rewardsPoints = 17
  var memberType: String
  
  if (rewardsPoints >= 50) {
    memberType = "Platinum"
  } else if (rewardsPoints >= 25){
    memberType = "Gold"
  } else if (rewardsPoints >= 10){
    memberType = "Silver"
  } else {
    memberType = "Bronze"
  }
  println("You are a $memberType type member.")

  // when
  ar season = "Fall"
  // Write your code below
  when(season) {
    "Winter"->println("Grow kale.")
    "Spring"-> println("Grow lettuce.")
    "Summer"-> println("Grow corn.")
    "Fall"-> println("Grow pumpkins.")
    else -> println("Not a valid season.")
  }

  // range
  var sHU = 17000
  var pungency: String

  // Write your code below
  if(sHU in 0..699){
    pungency = "very mild"
  } else if (sHU in 700..2999){
    pungency = "mild"
  } else if (sHU in 3000..24999){
    pungency = "moderate"
  } else if (sHU in 25000..69999){
    pungency = "high"
  } else {
    pungency = "very high"
  }
  println("A pepper with $sHU Scoville Heat Units has a $pungency pungency.")
}