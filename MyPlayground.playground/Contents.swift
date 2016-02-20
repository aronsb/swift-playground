// Playground - noun: a place where people can play

// feb 2016
//  - xcode 7.2.1
//  - swift 2.1.1

// xcode keyboard setup
//  - xcode / preferences / key bindings
//  - to change 'command' keys (command-c, etc.), system preferences / keyboard / modifier keys
//    - changes it for all apps (not just xcode)

// Git setup
//  - navigated to swift folder and typed git init (via terminal)
//  - didn't have to install or configure git on the mac
//  - created branch on GitHub
//  - opened playground in xcode
//  - source control / swift / configure swift / add remote (paste in branch url from GitHub)
//  - source control / commit

// option + hover (command) - help
// command + click (command) - kind of like 'go to definiton' ?

// issues
//  - wasn't able to create transition (segue) from one view controller to another (via dragging)
//   - had to zoom out for it to work
//   - can also try to drag to the to the other view controller via the document outline

import UIKit

// LET - constant - cannot be reassigned - immutable
// VAR - mutable
// type inference (automatically determines type)
let cardsInDeck = 52
var players = 4
var str = "Hello"
var x = 0

// ----- LOOP ------
/*
for i in 1...10 {
    x = i * i
    print("x is now \(x)")
}

// ----- LABEL -----
let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
label.backgroundColor = UIColor.lightGrayColor()
label.text = "My Label"
label.sizeToFit()
*/

// ----- CLASS -----
// swift supports single-inheritance
/*
class Person {
    var FirstName: String
    var LastName: String
    var Age: Int

    init(firstName: String, lastName: String, age: Int) {
        self.FirstName = firstName
        self.LastName = lastName
        self.Age = age
    }
    
    func DisplayName(title:String, year:Int) {
        // notice string placeholders
        print("\(title) \(self.FirstName) \(self.LastName) - \(String(year))")
    }

    // notice method return
    func IncreaseAge(ageIncrease:Int) -> Int {
        self.Age += ageIncrease
        return self.Age
    }
}

var p1 = Person(firstName: "Joe", lastName: "Blow", age: 30)
p1.DisplayName("Captain", year: 1980)
var newAge = p1.IncreaseAge(3)
*/

// ----- ARRAY ------
/*
var fruit = ["apple", "orange", "grape"]
fruit.append("banana")
*/

// ----- ARRAY OF COMPLEX OBJECTS ------
/*
var employees = [Person]()
employees.append(Person(firstName: "Joe", lastName: "Blow", age: 30))
*/

// ----- OPTIONALS -----
/*
var name: String?
var job: String!
var city: String

name = "Joe"
job = "Cook"
city = "Boulder"

if name != nil {
    print("name is \(name)")
    print("name is \(name!)")   // unwrap the optional
    
} else {
    print("name is nil")
}

print(name ?? "name is nil")    // shorthand

if job != nil {
    print("job is \(job)")
    
} else {
    print("job is nil")
}

// not a valid statement (city can never be nil)
//if city != nil {
//   print("city is \(city)")
//}
*/


// ----- FUNCTION -----
/*
func say(phrase: String) {
    print(phrase)
}

say("hello")

func say(phrase: String, times: Int) {
    for _ in 0...times {
        say(phrase)
    }
}

say("bye", times: 1)
*/

// ----- TUPLE -----
/*
var s1 = (code: 403, message: "error")
s1.code
s1.1
*/

// ----- DATES -----
let dateString = "2015-02-11"
let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let dateObj = dateFormatter.dateFromString(dateString)

dateFormatter.dateFormat = "MM-dd-yyyy"
print("Dateobj: \(dateFormatter.stringFromDate(dateObj!))")

// ----- NSLog -----
NSLog("hello")  // displays in debugger window


