//
//  ParagraphBank.swift
//  NeuroKinetic
//
//  Some of the paragraphs from paragraph bank are from this website
//  https://thoughtcatalog.com/koty-neelis/2015/06/31-of-the-most-beautiful-and-profound-passages-in-literature-youll-want-to-read-over-and-over-again/
//
//  Created by Rico Chao on 2019-10-28.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

import Foundation

class ParagraphBank {
    
    var paragraphNum: Int
    
    var paragraph: Paragraph
    
    init() {
        paragraphNum = 0
        
        paragraph = Paragraph()
    }
    
    func generateParagraph(paragraphNumber: Int) -> String {
        
        var temp: String
        
        switch paragraphNumber {
        case 0:
            temp = "Business casual is an ambiguously defined dress code that has been adopted by many professional and white-collar workplaces in Western countries. It entails neat yet casual attire and is generally more casual than informal attire but more formal than casual or smart casual attire."
            
        case 1:
            temp = "A virtual assistant (typically abbreviated to VA) is generally self-employed and provides professional administrative, technical, or creative assistance to clients remotely from a home office."
            
        case 2:
            temp = "The most important things are the hardest to say. They are the things you get ashamed of, because words diminish them — words shrink things that seemed limitless when they were in your head to no more than living size when they’re brought out."
            
        case 3:
            temp = "The Ministry of Truth, which concerned itself with news, entertainment, education and the fine arts. The Ministry of Peace, which concerned itself with war. The Ministry of Love, which maintained law and order. And the Ministry of Plenty, which was responsible for economic affairs. Their names, in Newspeak: Minitrue, Minipax, Miniluv and Miniplenty."
            
        case 4:
            temp = "The apartment below mine had the only balcony of the house. I saw a girl standing on it, completely submerged in the pool of autumn twilight."
            
        case 5:
            temp = "In the late summer of that year we lived in a house in a village that looked across the river and the plain to the mountains."
            
        case 6:
            temp = "I see a little silhouetto of a man. Scaramouche, Scaramouche, will you do the Fandango? Thunderbolt and lightning, very, very frightening me! (Galileo) Galileo, (Galileo) Galileo, Galileo Figaro magnifico"
            
        case 7:
            temp = "You can dance. You can jive. Having the time of your life. Ooh, see that girl. Watch that scene. Digging the dancing queen"
            
        case 8:
            temp = "I am an invisible man. No, I am not a spook like those who haunted Edgar Allan Poe; nor am I one of your Hollywood-movie ectoplasms. I am a man of substance, of flesh and bone, fiber and liquids—and I might even be said to possess a mind. I am invisible, understand, simply because people refuse to see me."
            
        case 9:
            temp = "Every record has been destroyed or falsified, every book rewritten, every picture has been repainted, every statue and street building has been renamed, every date has been altered. And the process is continuing day by day and minute by minute. History has stopped. Nothing exists except an endless present in which the Party is always right."
            
        case 10:
            temp = "Never again will you be capable of ordinary human feeling. Everything will be dead inside you. Never again will you be capable of love, or friendship, or joy of living, or laughter, or curiosity, or courage, or integrity. You will be hollow. We shall squeeze you empty, and then we shall fill you with ourselves."
            
        case 11:
            temp = "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose. You’re on your own. And you know what you know. And YOU are the one who’ll decide where to go..."
            
        case 12:
            temp = "Sometimes the clothes at Gap Kids are too flashy, so I’m forced to go to the American Girl store and order clothes for large colonial dolls."
            
        case 13:
            temp = "Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal"
            
        case 14:
            temp = "Wikipedia is the best thing ever. Anyone in the world can write anything they want about any subject. So you know you are getting the best possible information."
            
        case 15:
            temp = "I have a dream that one day this nation will rise up and live out the true meaning of creed: “We hold these truths to be self-evident, that all men are created equal”"
            
        default:
            temp = ""
        }
        
        paragraph.paragraph = temp
        
        paragraph.paragraphWordCount = paragraph.findWordCount(paragraph: paragraph.paragraph)
        
        paragraphNum = paragraphNumber
        
        return temp
    }
}

