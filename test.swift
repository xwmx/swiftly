#!/usr/bin/env swiftly

// Test file for swiftly

import Foundation

println("test.swift: running")

var index = 0
for argument in Process.arguments {
    println("test.swift argument [\(index)]: \(argument)")
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
