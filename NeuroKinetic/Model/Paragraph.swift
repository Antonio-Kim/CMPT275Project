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

    func findWordCount(paragraph: String, index: Int) -> Int {
        
        wordArr = paragraph.components(separatedBy: " ")
        
        paragraphWordCount = wordArr.count
        
        return paragraphWordCount
    }
}
