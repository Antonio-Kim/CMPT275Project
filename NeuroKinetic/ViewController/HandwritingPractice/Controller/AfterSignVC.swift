//
//  AfterSignVC.swift
//  NeuroKinetic
//
//  Created by Antonio Kim on 2019-11-22.
//  Copyright © 2019 teamRANDY. All rights reserved.
//
import FirebaseDatabase
import UIKit



class AfterSignVC: UIViewController {
    let preferences = UserDefaults.standard
    let currentLevelKey = "TotalHandwritingGamesPlayed"
    var gamesPlayed:Int = 0
    var amplitude1 = SignViewControl.ampl1.amplitude1
    var amplitude2: CGFloat!
    
    struct handwriting_statistics{
         static var handwriting_amplitude_array: [Float] = []
     }


    @IBOutlet weak var SignatureCanvasAfter: AfterSignView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if preferences.object (forKey:currentLevelKey) == nil{
            
        }
        else{
            gamesPlayed = preferences.integer(forKey: currentLevelKey)
        }
        let instruction = UILabel(frame: CGRect(x: 250, y: 100, width: 1000, height: 50))
        instruction.center.x = self.view.center.x
        instruction.center.y = (self.view.center.y)/2
        instruction.textAlignment = .center
        instruction.font = UIFont(name:"Montserrat-Bold", size: 40.0)
        //label.font = UIFont.preferredFont(forTextStyle: .footnote)
        instruction.text = "Please enter your signature in the field below"
        self.view.addSubview(instruction)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clear(_ sender: Any) {
        SignatureCanvasAfter.clear()
    }
    
    @IBAction func Done(_ sender: Any) {
        let ref = Database.database().reference()
        let calendar = Calendar.current
        let gameFinishTime :Date = Date()
        let year:Int = calendar.component(.year, from:gameFinishTime)
        let month:Int = calendar.component(.month, from:gameFinishTime)
        let day:Int = calendar.component(.day, from:gameFinishTime)
        
        amplitude2 = SignatureCanvasAfter.calculateAmplitude()
        let difference: CGFloat = CGFloat(amplitude1!.distance(to: amplitude2))
        //let diff: CGFloat = CGFloat((amplitude1?.distance(to: amplitude2))!)
        gamesPlayed += 1
        preferences.set(gamesPlayed, forKey: currentLevelKey)
        ref.child("Handwriting/\(year)-\(month)-\(day)/Game: \(gamesPlayed)/TotalGamesPlayed").setValue(gamesPlayed)
        ref.child("Handwriting/\(year)-\(month)-\(day)/Game: \(gamesPlayed)/AmplitudeDifference").setValue(difference)
        
        if(gamesPlayed >= 7)
        {
            handwriting_statistics.handwriting_amplitude_array.removeAll()
            for n in (gamesPlayed-6)...gamesPlayed {
            ref.child("Handwriting/\(year)-\(month)-\(day)").child("Game: \(n)").observeSingleEvent(of: .value, with: { (snapshot) in
                if(snapshot.exists())
                {
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    let key = snap.key
                    let value = snap.value
                    if(key == "AmplitudeDifference")
                    {
                        var ampl = (value as? Float)!
                        handwriting_statistics.handwriting_amplitude_array.append(ampl)
                    }
                    print("key =\(key) value = \(value!)")
                }
            }
                else
                {
                    handwriting_statistics.handwriting_amplitude_array.append(0)
                }
            })
            }
        }
        else
        {
            handwriting_statistics.handwriting_amplitude_array.removeAll()
            for n in 1...7 {
            ref.child("Handwriting/\(year)-\(month)-\(day)").child("Game: \(n)").observeSingleEvent(of: .value, with: { (snapshot) in
                if(snapshot.exists())
                {
                for child in snapshot.children
                {
                    let snap = child as! DataSnapshot
                    let key = snap.key
                    let value = snap.value
                    if(key == "AmplitudeDifference")
                    {
                        var ampl = (value as? Float)!
                        handwriting_statistics.handwriting_amplitude_array.append(ampl)
                    }
                    print("key =\(key) value = \(value!)")
                }
            }
                else
                {
                    handwriting_statistics.handwriting_amplitude_array.append(0)
                }
            })
            }
        }
        
    }

}
