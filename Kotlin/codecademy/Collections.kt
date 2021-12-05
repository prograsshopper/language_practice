fun main() {
    // list
    var waterSports = listOf("Wind Surfing", "Sailing", "Swimming", "Jet Skiing", "Water Skiing")
    println(waterSports)
    
    var unitedStatesMarathons = listOf("Boston Marathon", "Bank of America Chicago Marathon", "TCS NYC Marathon", "Marine Corps Marathon")
    println(unitedStatesMarathons[1])

    var fruitTrees = mutableListOf("Apple", "Plum", "Pear", "Cherry")
    println("I am growing ${fruitTrees.size} different types of fruit in my garden.")

    val planets = mutableListOf("Mercury", "Venus", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto")
    planets.remove("Pluto")
    planets.add("Earth")
    println(planets.random())

    // set
    var islandsOfHawaii = setOf("Maui", "Lanai", "Oahu", "Kauai")
    println(islandsOfHawaii.elementAt(2))
    println(islandsOfHawaii.elementAtOrNull(6))

    var apolloLandingSites = mutableSetOf("Mare Tranquillitatis", "Fra Mauro", "Hadley/Apennines", "Descartes", "Taurus-Littrow", "Oceanus Procellarum")
    println(apolloLandingSites)

    var uniqueParticipants = mutableSetOf<String>() 
    var participants = listOf("elePHPant", "Gopher", "Lenny", "Moby Dock", "Codey", "Gopher")
    uniqueParticipants.addAll(participants)
    println("The talent show has ${uniqueParticipants.size} unique participants.")
    uniqueParticipants.clear()
    println(uniqueParticipants)

    var testGrades = mutableSetOf(65, 50, 72, 80, 53, 84)
    var sum = testGrades.sum()
    var numStudents = testGrades.size
    var  average = sum / numStudents

    if (average < 65){
        println("Failed")
    } else {
        println("Passed")
    }

    // map
    var uniqueTransport = mapOf("India" to "Tuktuk", "Egypt" to "Felucca", "Peru" to "Totora Boat", "Hong Kong" to "Junk Boat")
    println("A unique mode of transportation that exists in Peru is ${uniqueTransport["Peru"]}.")
    println(uniqueTransport.keys)
    println(uniqueTransport.values)

    var tvShows = mutableMapOf("The Big Bang Theory" to 278, "Modern Family" to 250, "Bewitched" to 254, "That '70s Show" to 200)
    tvShows["The Big Bang Theory"] = 279
    println(tvShows) 

    var momaPaintings = mutableMapOf("Les Demoiselles d'avignon" to "Pablo Picasso", "The Starry Night" to "Vincent Van Gogh", "Mona Lisa" to "Leonardo Da Vinci", "The Persistance of Memory" to "Salvador Dali")

    if (!momaPaintings.containsValue("Claude Monet")) {
        // Write your code for Step 1 here 
        momaPaintings.put("Water Lillies", "Claude Monet")
    }
    // Write your code for Step 2 here
    momaPaintings.remove("Mona Lisa")
    println(momaPaintings)
}