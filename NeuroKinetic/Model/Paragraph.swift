//
//  Paragraph.swift
//  NeuroKinetic
//
//  Class for Paragraph which contains data members paragraphWordCount, paragraph, and wordArr,
//  and member functions findWordCount(String), as well as an init() for constructor
//
//  Created by Rico Chao on 2019-10-28.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import Foundation

class Paragraph {
    
    var paragraphWordCount: Int
    
    var paragraph: String
    
    var wordArr: [String]   //Separates the words from the paragraph and stores it in an array
    
    init() {
        paragraphWordCount = 0
        paragraph = ""
        wordArr = []
    }
    
    //Returns word count for the paragraph
    func findWordCount(paragraph: String) -> Int {
        
        if paragraph == "" {
            return 0
        }
        
        wordArr = paragraph.components(separatedBy: " ")    //Stores words in the array
        
        paragraphWordCount = wordArr.count  //Sets word count for paragraph
        
        return paragraphWordCount
    }
}

