//
//  AfterSignVC.swift
//  NeuroKinetic
//
//  Created by yyonata on 2019-11-21.
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

    @IBOutlet weak var SignatureCanvasAfter: AfterSignView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if preferences.object (forKey:currentLevelKey) == nil{
            
        }
        else{
            gamesPlayed = preferences.integer(forKey: currentLevelKey)
        }
        let label = UILabel(frame: CGRect(x: 250, y: 100, width: 950, height: 50))
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 40.0)
        //label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.text = "Please enter your signature in the field below"
        self.view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Clear(_ sender: Any) {
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
        let diff: CGFloat = CGFloat((amplitude1?.distance(to: amplitude2))!)
        gamesPlayed += 1
        preferences.set(gamesPlayed, forKey: currentLevelKey)
        ref.child("Handwriting/\(year)-\(month)-\(day)/Game: \(gamesPlayed)/TotalGamesPlayed").setValue(gamesPlayed)
        ref.child("Handwriting/\(year)-\(month)-\(day)/Game: \(gamesPlayed)/AmplitudeDifference").setValue(diff)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
