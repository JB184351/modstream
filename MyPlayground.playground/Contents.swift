import Foundation

func readTextFileAsArray(filePath: String) -> [String] {
    do {
        let fileURL = URL(fileURLWithPath: filePath)
        
        let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
        
        let lines = fileContents.components(separatedBy: .newlines)
        return lines
    } catch {
        print("Error reading file: \(error)")
        return []
    }
}

let filePath = "/Users/J-Beng/Desktop/day1.txt"
let input = readTextFileAsArray(filePath: filePath)

let part1sample = ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]
let part2sample = ["two1nine", "eightwothree", "abcone2threexyz", "xtwone3four", "4nineeightseven2", "zoneight234", "7pqrstsixteen"]

func replaceNumericWords(withNumbers input: String) -> String {
    var result = input
    let numericWordsMapping = ["one": "1", "two": "2", "three": "3", "four": "4", "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9", "ten": "10"]
    
    for (word, number) in numericWordsMapping {
        result = result.replacingOccurrences(of: word, with: number, options: .caseInsensitive)
    }
    
    return result
}

func getSumOfCalibrationNumbers(calibrationDocument: [String]) -> Int {
    var totalSum = 0
    var nums: [String] = []
    var num = ""
    
    
    for line in calibrationDocument {
        var newString = ""
        
        for char in line {
            newString.append(char)
            
            newString = replaceNumericWords(withNumbers: newString)
        }
        
        if let firstInt = newString.first(where: { $0.isNumber }) {
            num.append(firstInt)
            let index = newString.firstIndex(of: firstInt)!
            newString.remove(at: index)
        }
        
        if let lastInt = newString.last(where: { $0.isNumber }) {
            num.append(lastInt)
        }
        
        nums.append(num)
        num = ""
    }
    
    let actualNums = nums.map { Int($0) ?? 0 }
    print(actualNums)
    totalSum = actualNums.reduce(0, +)
    
    return totalSum
}

print(getSumOfCalibrationNumbers(calibrationDocument: part2sample))
