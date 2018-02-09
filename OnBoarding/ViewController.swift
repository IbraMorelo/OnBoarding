//
//  ViewController.swift
//  OnBoarding
//
//  Created by Ibra Morelo on 1/02/18.
//  Copyright © 2018 Ibra Morelo. All rights reserved.
//

import UIKit
import paper_onboarding

class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {

    @IBOutlet var onboarding: OnboardingView!
    @IBOutlet var getStartedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboarding.dataSource = self
        onboarding.delegate = self
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColorThree = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [
            
            OnboardingItemInfo(informationImage: UIImage(named: "rocket")!,
                               title: "A Great Rocket Start",
                               description: "Tootsie roll tart marshmallow oat cake macaroon. Marshmallow fruitcake powder jelly jelly-o. Carrot cake brownie candy canes.",
                               pageIcon: UIImage(named: "key")!,
                               color: backgroundColorOne,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont,
                               descriptionFont: descriptionFont),
            OnboardingItemInfo(informationImage: UIImage(named: "brush")!,
                               title: "A Great Brush Start",
                               description: "Tootsie roll tart marshmallow oat cake macaroon. Marshmallow fruitcake powder jelly jelly-o. Carrot cake brownie candy canes.",
                               pageIcon: UIImage(named: "key")!,
                               color: backgroundColorTwo,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont,
                               descriptionFont: descriptionFont),
            OnboardingItemInfo(informationImage: UIImage(named: "notification")!,
                               title: "A Great Notification Start",
                               description: "Tootsie roll tart marshmallow oat cake macaroon. Marshmallow fruitcake powder jelly jelly-o. Carrot cake brownie candy canes.",
                               pageIcon: UIImage(named: "key")!,
                               color: backgroundColorThree,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: titleFont,
                               descriptionFont: descriptionFont)][index]
    }
    
    func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            if self.getStartedBtn.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedBtn.alpha = 0
                })
            }
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedBtn.alpha = 1
            })
        }
    }
    
    
    @IBAction func gotStarted(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(true, forKey: "onboardingComplete")
        
        userDefaults.synchronize()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


