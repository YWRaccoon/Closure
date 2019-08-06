
//Closure
var hello = { () -> () in
    print("Hello, I'm Raccoon.")
}
hello()



print("\n === with parameters === \n")
// with parameters
var hasFood = { (food: String) -> () in
    print("YW Raccoon has \(food)")
}
hasFood("fruits")



print("\n === be parameter === \n")
// be parameter
func rotate(times: Int, finish: ()-> ()) {
    for _ in 1...times {
        print("Raccoon is rotating.")
        finish()
    }
}
rotate(times: 3) { ()-> () in
    print("Raccoon finished once.")
}



print("\n === === === \n")
// omit
func play(times: Int, result: (Int, String) -> String) {
    for i in 1...times {
        print("Raccoon is playing.")
        print(result(i, "mershmello disappeared"))
    }
}

play(times: 3, result: { (time: Int, result: String) -> String in
    return "\(time). Raccoon plays and \(result)."
})



// Trailing Closures
print("\n === Trailing Closures === \n")
play(times: 3) { (time: Int, result: String) -> String in
    return "\(time). Raccoon plays and \(result)."
}



// Inferring Type From Context
print("\n === Inferring Type From Context === \n")
play(times: 3) { time, result -> String in
    return "\(time). Raccoon plays and \(result)."
}

play(times: 3) { time, result in
    return "\(time). Raccoon plays and \(result)."
}



// Shorthand Argument Names
print("\n === Shorthand Argument Names === \n")
play(times: 3) {
    return "\($0). Raccoon plays and \($1)."
}




print("\n === Implicit Returns from Single-Expression Closures === \n")

// Implicit Returns from Single-Expression Closures
// if return single code, can omit return
play(times: 3) {
    "\($0). Raccoon plays and \($1)"
}



print("\n === Operator Methods === \n")

// Operator Methods
// can use +, -, *, / be the parameter for closure
func eat(day: Int, foods: (String, String) -> String) {
    let food = foods("fruits", " & snack")
    print("Raccoon eat \(food) in day \(day)")
}

eat(day: 5, foods: +)



print("\n === @escaping === \n")

// @escaping
// make the fuction can continue to doing something after closure return, so we need @escaping
// the Optional closure is @escaping
class SleepRaccoon {
    var name: String = ""
    var sleepEscaping: (() -> ())?

    func prepareToSleep() {
        getQuiltReady {
            print("Raccoon has bed and quilt.")
        }
    }

    func getQuiltReady(ready: @escaping () -> ()) {
        ready()
        self.sleepEscaping = ready
    }
}

let sleepRaccoon = SleepRaccoon()
sleepRaccoon.prepareToSleep()
sleepRaccoon.sleepEscaping!()


print("\n === sort === \n")
// sort
var numbers = [5, 8, 3, 9]
numbers.sorted { $0 < $1 }
print(numbers)
numbers.sort { $0 < $1 }
print(numbers)
