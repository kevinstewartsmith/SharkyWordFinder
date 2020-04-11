//
//  DataModel.swift
//  AstroHangman
//
//  Created by Kevin Smith on 1/9/20.
//  Copyright © 2020 Kevin Smith. All rights reserved.
//

import Foundation

class DataModel{
    //let randomNumber : UInt32?
    //let randoInt : Int?
    //let randoInt : Int
    //var nutrientsArray : [String?]
    var secretWord : String?
    let wordManipulator : WordManipulator
    var blankWordArray : [String] = []
    init() {
        wordManipulator = WordManipulator()
        secretWord = wordManipulator.getRandomWord()
        var blankWord = wordManipulator.createBlankWord(wordLocal: secretWord ?? "jesus2")
        wordManipulator.setBlankWord(word: blankWord)
       // nutrientsArray =  ["carbohydrates","fats","protein","sodium","calories"]
        //randomNumber = arc4random_uniform(5)
       // randoInt = Int.random(in: 0..<5)
       // secretWord = nutrientsArray[randoInt]

    }
    
    func getSecretWord() -> String? {
        //var secretWord : String?
        
        
        
        

        return secretWord
    }
    
    func getPlayerView(viewString: String)-> String {
        if secretWord != nil {
             var wordy = wordManipulator.createBlankWord(wordLocal: viewString ?? "niiiil")
            return wordy
        } else {
           return ""
        }
        

        
    }
    func getBlankWord()-> String {
        let blankWord = wordManipulator.getBlankeWord()
        //return blankWord
        let word = blankWordArray.joined()
        return word
    }
    func createSecretWord(){
        secretWord = wordManipulator.getRandomWord()
    }
    
    func guessLetter(letter: String)-> String{
        let char =  Character(letter)

        if secretWord?.contains(char) ?? false{
            //wordManipulator.updateGame(char: char)
            wordManipulator.updatePlayerView(char: char)
            var newBlankWord = wordManipulator.getBlankeWord()
            blankWordArray = wordManipulator.updatePlayerViewWord(word: secretWord ?? "word", letter: letter, array: blankWordArray)
            return newBlankWord
        } else {
            return "not contained!!!"
        }

    }
    
    
    func initiateWordArray(word: String) -> String {
        blankWordArray = []
        for i in word{
            blankWordArray.append("_")
        }
        return blankWordArray.joined()
    }
    func getBlankWordArrayString() ->String{
        return blankWordArray.joined()
    }
  
}
    


//extension String {
//    func indicesOf(string: String) -> [Int] {
//        var indices = [Int]()
//        var searchStartIndex = self.startIndex
//
//        while searchStartIndex < self.endIndex,
//            let range = self.range(of: string, range: searchStartIndex..<self.endIndex),
//            !range.isEmpty
//        {
//            let index = distance(from: self.startIndex, to: range.lowerBound)
//            indices.append(index)
//            searchStartIndex = range.upperBound
//        }
//
//        return indices
//    }
//}

