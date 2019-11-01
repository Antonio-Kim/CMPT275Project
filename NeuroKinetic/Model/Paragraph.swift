//
//  Paragraph.swift
//  NeuroKinetic
//
//  Created by Rico Chao on 2019-10-28.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import Foundation

class Paragraph {

    var paragraphWordCount: Int

    var paragraph: String

    var wordArr: [String]

    init() {
        paragraphWordCount = 0
        paragraph = ""
        wordArr = []
    }

    //Returns paragraphWordCount
    func findWordCount(paragraph: String) -> Int {
        
        if paragraph == "" {
            return 0
        }
        
        wordArr = paragraph.components(separatedBy: " ")    //Stores words in the array
        
        paragraphWordCount = wordArr.count  //Sets word count for paragraph
        
        return paragraphWordCount
    }
}
