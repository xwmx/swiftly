#!/usr/bin/env swiftly

// Example file for swiftly

import Foundation

println("example.swift: running")

var index = 0
for argument in Process.arguments {
    println("example.swift argument [\(index)]: \(argument)")
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
