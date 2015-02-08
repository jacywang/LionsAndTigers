//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by JIAN WANG on 2/6/15.
//  Copyright (c) 2015 JACY WANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedlabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers: [Tiger] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.age = 3
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal Tiger"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        
        self.myTigers.append(myTiger)
        
        println("My tiger's name is \(myTiger.name), its age is \(myTiger.age), its breed is \(myTiger.breed) and its image is \(myTiger.image)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedlabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        
        var secondTiger = Tiger()
        secondTiger.age = 2
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        secondTiger.chuff()
        
        var thirdTiger = Tiger()
        thirdTiger.age = 5
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.age = 1
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffNumberOfTimes(5, isLoud: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        var randomIndex: Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while currentIndex == randomIndex
        
        currentIndex = randomIndex
        
        let tiger = myTigers[randomIndex]
        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedlabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                self.myImageView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.breedlabel.text = tiger.breed
                self.randomFactLabel.text = tiger.randomFact()
            }, completion: {
                (finished: Bool) -> () in
        })
    }

}

