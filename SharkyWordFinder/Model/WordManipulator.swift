//
//  WordManipulator.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/9/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import Foundation


class WordManipulator{
    var word : String?
    var blankWord : String?
    var wordArray : [String] = []
    var blankWordArray : [String] = []
    
    init(){
        wordArray = ["fats","carbohydrates","protein","calories" ]
    }
    
    func getWord(word: String)-> String? {
        return ""
    }
    func getBlankeWord()-> String{
        return blankWord ?? "??????"
    }
    func createBlankWord(wordLocal: String) -> String {
        var randoWord = ""
        var newBlankWord = ""
        
        if wordLocal != nil {
            randoWord = wordLocal
            var count = randoWord.count
            for i in 1...count{
                newBlankWord = "\(newBlankWord)_"
            }
            return newBlankWord
        } else {
            return "Must Enter Word!!!!"
        }
        
    }
        
    func setBlankWord(word: String){
        blankWord = word
    }
        
    
    
    func getRandomWord() -> String? {
        var randoInt = Int.random(in: 0..<wordArray.count)
        word = wordArray[randoInt]
        return word
         
    }
    
    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    func updatePlayerView(char: Character) -> String {
        var newString = ""
        let defaultArray: [Int] = []
        var array = word?.indicesOf(string: String(char))
        print(array)
        newString = blankWord ?? "blank word nil"
        for i in array ?? defaultArray {
            newString = replace(myString: newString ?? "blank word nil", i, char)
        }
        blankWord = newString
        print(newString)
        return newString
    }
    
//    func updateGame(char: Character){
//        var letterIdx = word?.indicesOf(string: String(char))
//        let defaultArray = [0]
//        print("indices of \(char): \(letterIdx) ")
//        for i in letterIdx ?? defaultArray{
//           //print("IIII: \(i)")
//            blankWordArray[i] = String(char)
//        }
//        //print(revealedLetters)
//        blankWord = blankWordArray.joined()
//    }
    
    func updatePlayerViewWord(word: String, letter: String, array: [String])->[String]{
        let idxArray = word.indicesOf(string: letter)
        var localArray : [String] = array
        print("indicesOfLetter: \(idxArray)")
        print(localArray.count)
//        for i in idxArray {
//            localArray[i] = letter
//        }
        return localArray
    }
    
    func addLetterToBlankArray(char: Character, oldArray: [String], word: String) -> [String] {
        

        
        return ["_ARAAY"]
    }
    
}

extension String {
    func indicesOf(string: String) -> [Int] {
        var indices = [Int]()
        var searchStartIndex = self.startIndex

        while searchStartIndex < self.endIndex,
            let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
            !range.isEmpty
        {
            let index = distance(from: self.startIndex, to: range.lowerBound)
            indices.append(index)
            searchStartIndex = range.upperBound
        }

        return indices
    }
}
