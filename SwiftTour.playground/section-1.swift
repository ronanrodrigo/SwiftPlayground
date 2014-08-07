// -----------------------
// Playground - noun: a place where people can play
// -----------------------


import Cocoa


// -----------------------
// Variables and statics
// -----------------------


var str = "Hello, playground"
var myVariable = 42
myVariable += 8

// Variables and constants
// Unitialized var
var blankVariable: String
blankVariable = "a"
println(blankVariable)

let myConstant = myVariable+10
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


// -----------------------
// Arrays and dictionaries
// -----------------------


var shoppingList = ["Catfish", "Water", "Tulips", "Blue paint"]
shoppingList.count
shoppingList.append("Dog")
shoppingList.reverse()
shoppingList.endIndex
shoppingList.isEmpty

var occupations = ["Malcolm": "Captain", "Kaylee": "Mechanic"]
occupations["Jayne"] = "Public Relations"

var emptyArray = [String]()
emptyArray.append("Oi")
emptyArray[0]

var emptyDictionary = Dictionary<String, Float>()
emptyDictionary["Ronan"] = 3
emptyDictionary.description


// -----------------------
// Control flow
// if, switch, for-in, for, while and do-while
// -----------------------


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores{
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

var optionalString: String? = "Hello"
optionalString == nil
optionalString = nil
optionalString == nil

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}


let vegetable = "red pepper"
switch vegetable{
case "celery":
    let vegetableComment = "Add some raisins and mae ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich"
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
    
}


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8, 13, 24, 37],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var sequence: String?
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            sequence = kind
        }
    }
}
if let s = sequence{
    let result = "The largest number is \(largest) an it is in \(s) sequence"
}



var n = 2
while n < 100 {
    n = n*2
}
n

var m = 2
do {
    m = m*2
} while m < 100
m


var fisrtForLoop = 0
for i in 0..<3{
    fisrtForLoop += i
}
fisrtForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i{
    secondForLoop += 1
}
secondForLoop


// -----------------------
// Funcions and closures
// -----------------------


func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}
greet("Ronan", "Sunday")

func getGasPrices() -> (Double, Double, Double){
    return (3.59, 3.69, 3.79)
}
getGasPrices()

func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
sumOf()
sumOf(42,597,12)

func averageOf(numbers: Int...) -> Int{
    var av = 0
    var sum = 0
    for number in numbers{
        sum += number
    }
    av = sum/numbers.count
    return av
}
averageOf(10,2,10,7)

func returnFifteen() -> Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> (Int -> Int){
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(5)

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    list
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    number
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    })

numbers.map({
    (number: Int) -> Int in
    var result = 0
    if number%2 != 0{
        result = 3 * number
    }
    return result
    })

var test = numbers.map({number in 3*number})
test.count


// -----------------------
// Objects and Classes
// -----------------------


class Shape{
    var numberOfSides = 0
    let borderWidth = 1
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) and the border width is \(borderWidth)"
    }
    func setSides(sides: Int){
        self.numberOfSides = sides
    }
}

var shape = Shape()
shape.numberOfSides
shape.setSides(10)
shape.numberOfSides = 2*shape.numberOfSides
shape.numberOfSides
shape.simpleDescription()


class NamedShape{
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func simpleDescription() -> String{
        return "A shape with \(self.numberOfSides) sides."
    }
}

class Square: NamedShape{
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String{
        return "A square with sides of length \(sideLength)"
    }
}
let square = Square(sideLength: 5.3, name: "My test square")
square.area()
square.simpleDescription()


class Circle: NamedShape{
    var radius: Double
    
    init(radius: Double, name: String){
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double{
        return 3.14*pow(radius, 2)
    }
    
    override func simpleDescription() -> String{
        return "A square with sides of radius \(radius)"
    }
}
let circle = Circle(radius: 3, name: "Le circle")
circle.area()


class EquilateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
    get {
        return 3.0*sideLength
    }
    set {
        sideLength = newValue/3.0
    }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "A triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength
triangle.perimeter


class TriangleAndSquare {
    var triangle: EquilateralTriangle{
    willSet{
        square.sideLength = newValue.sideLength
    }
    }
    
    var square: Square{
    willSet{
        triangle.sideLength = newValue.sideLength
    }
    }
    
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "Another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "Larger square")
triangleAndSquare.triangle.sideLength
triangleAndSquare.square.sideLength


class Counter{
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int){
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "Optional square")
let sideLegth = optionalSquare?.sideLength


// -----------------------
// Enumerations and structures
// -----------------------


enum Rank: Int{
    case Ace = 1
    case Two, Three, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
            
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()
let seven = Rank.Seven
let three = Rank.Three
let jack = Rank.Jack
seven.toRaw() > three.toRaw()
seven.toRaw() > jack.toRaw()
jack.toRaw()
three.simpleDescription()

if let convertedRank = Rank.fromRaw(1){
    let aceDescription = convertedRank.simpleDescription()
}


enum Suit{
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String{
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "heatrs"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String{
        switch self {
        case .Clubs, .Hearts:
            return "red"
        default:
            return "black"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription =  hearts.simpleDescription()

let spades = Suit.Spades
spades.color()


struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription()). \(suit.simpleDescription().capitalizedString) are \(suit.color())."
    }
}
let threeOfHearts = Card(rank: .Three, suit: .Hearts)
let threeOfSpadesDescription = threeOfHearts.simpleDescription()

let aceOfSpades = Card(rank: .Ace, suit: .Spades)
let aceOfSpadesDescription = aceOfSpades.simpleDescription()





