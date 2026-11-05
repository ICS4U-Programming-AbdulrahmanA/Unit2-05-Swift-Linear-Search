import Foundation

// The list contains 10 numbers, each from 0 to 100.
let arraySize = 10
let maxRandomNumber = 100

// Check each number from left to right.
func linearSearch(_ numbers: [Int], target: Int) -> Int {
    for (index, number) in numbers.enumerated() {
        if number == target {
            // Return the position of the first matching number.
            return index
        }
    }

    // Return -1 when the number is not in the list.
    return -1
}

// Make a new list of random numbers.
func populateArray() -> [Int] {
    (0..<arraySize).map { _ in Int.random(in: 0...maxRandomNumber) }
}

// Tell the user what to do before showing the first list.
print("Choose a number from the list to search for. Type 'q' to quit.")

// Keep playing until the user enters q.
var input = ""
while input.lowercased() != "q" {
    // Create and sort a fresh list for this search.
    var numbers = populateArray()
    numbers.sort()

    // Show the whole list before waiting for the user's number.
    print(numbers.map(String.init).joined(separator: " "))
    print("Number:")

    // Read one line of input. Stop if the program receives no more input.
    guard let nextInput = readLine() else {
        break
    }
    input = nextInput

    // Let the user quit with either q or Q.
    if input.lowercased() == "q" {
        print("Thanks for playing!")
        continue
    }

    // Convert the user's text to a whole number.
    guard let target = Int(input) else {
        print("Invalid input. Enter a whole number or 'q' to quit.")
        continue
    }

    // Search the list and report whether the number was found.
    let index = linearSearch(numbers, target: target)
    if index >= 0 {
        print("\(target) is in the list at index \(index).")
    } else {
        print("\(target) is not in the list.")
    }
}
