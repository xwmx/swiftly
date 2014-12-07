#!/usr/bin/env swiftly

// Example file for swiftly

import Foundation

var arguments = Process.arguments
// Get program name
let programName = arguments[0].lastPathComponent
// Remove program name from argument list
arguments.removeAtIndex(0)

println("\(programName): running")

var index = 0
for argument in Process.arguments {
    println("\(programName) argument [\(index)]: \(argument)")
    index++
}

// Handle STDIN.
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let inputString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
    let trimmedString = inputString!.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
    return trimmedString
}


if Process.arguments[1] == "-stdin" {
    println(input())
}
