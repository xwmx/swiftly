#!/usr/bin/env swiftly

// Example file for swiftly
//
// Demonstrates that basic input and output works exactly the same for a
// program being run with swiftly as it does for one that's being run with
// just swift. This program also demonstrates the swiftly shebang.
//
// William Melody, 2014 - https://github.com/alphabetum/swiftly/


import Foundation

// Get arguments
let arguments = Process.arguments
// Get program name
let programName = arguments[0].lastPathComponent

// Announce that the program is running.
println("\(programName): running")

// Print each of the arguments, including the process name.
var index = 0
for argument in arguments {
    println("\(programName) argument [\(index)]: \(argument)")
    index++
}

// Handle standard input.
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let inputString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
    let trimmedString = inputString!.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    return trimmedString
}

// If the only argument is the program name, process standard input.
if arguments.count == 1 {
    let stdinput = input()
    println("standard input: \(stdinput)")
}
