//
//  ParagraphBank.swift
//  NeuroKinetic
//
//  Created by Rico Chao on 2019-10-28.
//  Copyright © 2019 teamRANDY. All rights reserved.
//

//import Foundation

class ParagraphBank {
    
    //var paragraphNum: Int
    
    var paragraph: Paragraph

    init() {
        paragraph = Paragraph()
    }
    
    func generateParagraph(paragraphNumber: Int) {
        
        switch paragraphNumber {
        case 0:
            paragraph.paragraph = "Atticus said to Jem one day, “I’d rather you shot at tin cans in the backyard, but I know you’ll go after birds. Shoot all the blue jays you want, if you can hit ‘em, but remember it’s a sin to kill a mockingbird.” That was the only time I ever heard Atticus say it was a sin to do something, and I asked Miss Maudie about it. “Your father’s right,” she said. “Mockingbirds don’t do one thing except make music for us to enjoy. They don’t eat up people’s gardens, don’t nest in corn cribs, they don’t do one thing but sing their hearts out for us. That’s why it’s a sin to kill a mockingbird."
        
        case 1:
            paragraph.paragraph = "We believe that we can change the things around us in accordance with our desires—we believe it because otherwise we can see no favourable outcome. We do not think of the outcome which generally comes to pass and is also favourable: we do not succeed in changing things in accordance with our desires, but gradually our desires change. The situation that we hoped to change because it was intolerable becomes unimportant to us. We have failed to surmount the obstacle, as we were absolutely determined to do, but life has taken us round it, led us beyond it, and then if we turn round to gaze into the distance of the past, we can barely see it, so imperceptible has it become."
        
        case 2:
            paragraph.paragraph = "The most important things are the hardest to say. They are the things you get ashamed of, because words diminish them — words shrink things that seemed limitless when they were in your head to no more than living size when they’re brought out. But it’s more than that, isn’t it? The most important things lie too close to wherever your secret heart is buried, like landmarks to a treasure your enemies would love to steal away. And you may make revelations that cost you dearly only to have people look at you in a funny way, not understanding what you’ve said at all, or why you thought it was so important that you almost cried while you were saying it. That’s the worst, I think. When the secret stays locked within not for want of a teller but for want of an understanding ear."
        
        case 3:
            paragraph.paragraph = "The Ministry of Truth, which concerned itself with news, entertainment, education and the fine arts. The Ministry of Peace, which concerned itself with war. The Ministry of Love, which maintained law and order. And the Ministry of Plenty, which was responsible for economic affairs. Their names, in Newspeak: Minitrue, Minipax, Miniluv and Miniplenty."
        
        case 4:
            paragraph.paragraph = "The apartment below mine had the only balcony of the house. I saw a girl standing on it, completely submerged in the pool of autumn twilight. She wasn't doing a thing that I could see, except standing there leaning on the balcony railing, holding the universe together. The way the profile of her face and body refracted in the soupy twilight made me feel a little drunk."
        
        case 5:
            paragraph.paragraph = "In the late summer of that year we lived in a house in a village that looked across the river and the plain to the mountains. In the bed of the river there were pebbles and boulders, dry and white in the sun, and the water was clear and swiftly moving and blue in the channels. Troops went by the house and down the road and the dust they raised powdered the leaves of the trees. The trunks of the trees too were dusty and the leaves fell early that year and we saw the troops marching along the road and the dust rising and leaves, stirred by the breeze, falling and the soldiers marching and afterward the road bare and white except for the leaves."

        case 6:
            paragraph.paragraph = "It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair, we had everything before us, we had nothing before us, we were all going direct to Heaven, we were all going direct the other way — in short, the period was so far like the present period, that some of its noisiest authorities insisted on its being received, for good or for evil, in the superlative degree of comparison only."
        
        case 7:
            paragraph.paragraph = "It is a truth universally acknowledged, that a single man in possession of a good fortune must be in want of a wife. However little known the feelings or views of such a man may be on his first entering a neighbourhood, this truth is so well fixed in the minds of the surrounding families, that he is considered as the rightful property of some one or other of their daughters."
        
        case 8:
            paragraph.paragraph = "I am an invisible man. No, I am not a spook like those who haunted Edgar Allan Poe; nor am I one of your Hollywood-movie ectoplasms. I am a man of substance, of flesh and bone, fiber and liquids—and I might even be said to possess a mind. I am invisible, understand, simply because people refuse to see me. Like the bodiless heads you see sometimes in circus sideshows, it is as though I have been surrounded by mirrors of hard, distorting glass. When they approach me they see only my surroundings, themselves, or figments of their imagination—indeed, everything and anything except me."

        case 9:
            paragraph.paragraph = "Every record has been destroyed or falsified, every book rewritten, every picture has been repainted, every statue and street building has been renamed, every date has been altered. And the process is continuing day by day and minute by minute. History has stopped. Nothing exists except an endless present in which the Party is always right."
        
        case 10:
            paragraph.paragraph = "Never again will you be capable of ordinary human feeling. Everything will be dead inside you. Never again will you be capable of love, or friendship, or joy of living, or laughter, or curiosity, or courage, or integrity. You will be hollow. We shall squeeze you empty, and then we shall fill you with ourselves."
        
        case 11:
            paragraph.paragraph = "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose. You’re on your own. And you know what you know. And YOU are the one who’ll decide where to go…"
        
        case 12:
            paragraph.paragraph = "Sometimes the clothes at Gap Kids are too flashy, so I’m forced to go to the American Girl store and order clothes for large colonial dolls."
        
        case 13:
            paragraph.paragraph = "No, Rose, they are not breathing. And they have no arms or legs … Where are they? You know what? If we come across somebody with no arms or legs, do we bother resuscitating them? I mean, what quality of life do we have there?"
        
        case 14:
            paragraph.paragraph = "Wikipedia is the best thing ever. Anyone in the world can write anything they want about any subject. So you know you are getting the best possible information."
        
        case 15:
            paragraph.paragraph = "hello I am me"
        
        default:
            paragraph.paragraph = ""
        }
    }
}
