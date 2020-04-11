//
//  Model.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/12/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import Foundation

class Model {
    var word : String?
    var blankWordArray : [String] = []
    var wordArray : [String]
    let wordManipulator = WordManipulator()
    var wordCharArray : [String] = []
    var revealedLetters : Int?
    var startingGuesses : Int?
    var takeAwayGuess : Bool?
    var guessIsCorrect : Bool?
    init(){
        wordArray = ["fats","carbohydrates","protein","calories","grains","dairy"]
        word = self.selectRandomWord()
    }
    
    //Returns a random woard from word array
    func selectRandomWord() -> String {
        var randoInt = Int.random(in: 0..<wordArray.count)
        word = wordArray[randoInt]
        print("Selected random word: \(word)")
        return word ?? "butter"
    }
    
    
    func getSecretWord()-> String {
        return word ?? "Butter"
    }
    
    func getBlankWord() -> String {
        var word = blankWordArray.joined()
        print("joined word: \(word)")
        return word
    }
    
    func makeNewBlankArrayFromWord(word: String) -> [String]{
        var array : [String] = []
        for i in 1...word.count {
            array.append("_ ")
        }
        print(array)
        blankWordArray = array
        return array
    }
    
    func set(word theWord: String){
        word = theWord
    }
    
    func guess(letter: String) -> String {
        let char =  Character(letter)
         let wordArray : [Character] = Array(word ?? "guess")
        print("model.guess char: \(char)    \(word?.contains(char) ?? false)  \(blankWordArray)")
        if word?.contains(char) ?? false {
            guessIsCorrect = true
            takeAwayGuess = false
            var charString = String(char)
            let idxArray = word?.indicesOf(string: charString)
            print(idxArray)
            print(charString)
            self.revealedLetters = (revealedLetters ?? 0) + (idxArray?.count ?? 1)
            print(wordArray)
            for i in idxArray ?? [0] {
                blankWordArray[i] = "\(wordCharArray[i]) "
            }
            var newBlankWord = self.getBlankWord()
            print(self.getBlankWord())
            return newBlankWord
        } else {
            print("not contained!!!")
            takeAwayGuess = true
            guessIsCorrect = false
            return self.getBlankWord()
            
        }
        
        return "guess"
    }
    func makeWordCharArray(word: String) -> [String] {
        var array : [String] = []
        var count = 0
        for i in word {
            array.append(String(i))
        }
        print("Array: \(array)")
        wordCharArray = array
        return array
    }
    func getWordCharArray() -> [String] {
        return wordCharArray
    }
}
