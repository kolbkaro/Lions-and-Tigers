//
//  ViewController.swift
//  2LionsAndTigers
//
//  Created by Karolis Kolbus on 22/03/2015.
//  Copyright (c) 2015 Karolis Kolbus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []
    var currentAnimal = (species: "Tiger", index: 0)
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        myTigers.append(myTiger)
        myTiger.chuff()
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tiggres"
        secondTiger.breed = "Indo Chinese"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffNumberOfTimes(3, isLoud: false)
        
        var lion = Lion()
        lion.name = "Mufasa"
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.subspecies = "West African"
        lion.roar()
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        var lioness = Lion()
        lioness.name = "Sarabi"
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.subspecies = "Barbary"
        lioness.roar()
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        lionCub.roar()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        self.lionCubs += [lionCub, femaleLionCub]
        
        self.lions += [lion, lioness]
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        flippingAnimals()
        updateView()
    }
        func flippingAnimals () {
            switch self.currentAnimal {
            case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(self.lions.count)))
            self.currentAnimal = ("Lion", randomIndex)
            case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
                currentAnimal = ("LionCub", randomIndex)
            default:
            let randomIndex = Int(arc4random_uniform(UInt32(self.myTigers.count)))
            self.currentAnimal = ("Tiger", randomIndex)
            }
        }
        
        func updateView () {
            UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                
                if self.currentAnimal.species == "Tiger" {
                    var tiger = self.myTigers[self.currentAnimal.index]
                    self.nameLabel.text = tiger.name
                    self.ageLabel.text = "\(tiger.age)"
                    self.breedLabel.text = tiger.breed
                    self.myImageView.image = tiger.image
                    self.randomFactLabel.text = tiger.randomFact()
                } else if self.currentAnimal.species == "Lion" {
                    var lion = self.lions[self.currentAnimal.index]
                    self.nameLabel.text = lion.name
                    self.ageLabel.text = "\(lion.age)"
                    self.breedLabel.text = lion.subspecies
                    self.myImageView.image = lion.image
                    self.randomFactLabel.text = lion.randomFact()
                } else if self.currentAnimal.species == "LionCub" {
                        let lionCub = self.lionCubs[self.currentAnimal.index]
                        self.myImageView.image = lionCub.image
                        self.breedLabel.text = lionCub.subspecies
                        self.ageLabel.text = "\(lionCub.age)"
                        self.nameLabel.text = lionCub.name
                        self.randomFactLabel.text = lionCub.randomFact()
                }
                
                    self.randomFactLabel.hidden = false
                
                }, completion: {
                    (finished: Bool) -> () in
            })

        }
}