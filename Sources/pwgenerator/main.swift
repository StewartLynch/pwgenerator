import ArgumentParser
import Foundation

struct PWGenerator: ParsableCommand {
    static let configuration =  CommandConfiguration(abstract: "Generates a Random Password", version: "0.0.1")
    
    @Argument(help: "Specified length") var length: Int = 8
    @Flag(name: .short, help: "Include uppercase letters") var upperCase = false
    @Flag(name: .short, help: "Include special characters") var specialCharacters = false
    @Flag(name: .short, help: "Include numbers") var numbers = false
    
    mutating func run() throws {
        let ucase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let digits = "0123456789"
        let lcase = ucase.lowercased()
        let symbols = "@#$%^&*;.,!"
        var pw = ""
        for _ in 0...length-1 {
            if upperCase {
                if Bool.random() {
                    pw += String(ucase.randomElement()!)
                    continue
                }
            }
            if numbers {
                if Bool.random() {
                    pw += String(digits.randomElement()!)
                    continue
                }
            }
            if specialCharacters {
                if Bool.random() {
                    pw += String(symbols.randomElement()!)
                    continue
                }
            }
            pw += String(lcase.randomElement()!)
        }
        print(pw)
    }
}

PWGenerator.main()
