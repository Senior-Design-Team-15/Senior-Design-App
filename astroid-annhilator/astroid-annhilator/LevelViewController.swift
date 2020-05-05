//
//  LevelViewController.swift
//  astroid-annhilator
//
//  Created by O'Brien, Kate C on 5/4/20.
//  Copyright © 2020 Ally Feldmeier. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {
    var levelEasy : Bool = false
    var levelMedium : Bool = false
    var levelHard : Bool = false
    var levelPicked = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func levelEasyPicked(_ sender: Any) {
        levelEasy = true
        levelMedium = false
        levelHard = false
        selectLevel()
    }
    
    @IBAction func levelMediumPicked(_ sender: Any) {
        levelEasy = false
        levelMedium = true
        levelHard = false
        selectLevel()
    }
    @IBAction func levelHardPicked(_ sender: Any) {
        levelEasy = false
        levelMedium = false
        levelHard = true
        selectLevel()
    }
    
    func selectLevel(){
        if(levelEasy == true){
            levelPicked = "easy"
        }
        if(levelMedium == true){
            levelPicked = "medium"
        }
        if(levelHard == true){
            levelPicked = "hard"
        }
        print(levelPicked)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let info = segue.destination as! GameViewController
        info.level = self.levelPicked
        
        
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
