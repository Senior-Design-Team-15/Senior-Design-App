//
//  ProgressReportViewController.swift
//  astroid-annhilator
//
//  Created by O'Brien, Kate C on 4/19/20.
//  Copyright © 2020 Ally Feldmeier. All rights reserved.
//

import UIKit
import Darwin

class ProgressReportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // setOutput()
        
      //  wordCount.text = "hi"

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var numOfQ: UILabel!
    @IBOutlet weak var meanLengthUtterance: UILabel!
    @IBOutlet weak var wordCount: UILabel!
    @IBOutlet weak var timeElasped: UILabel!
    
    @IBAction func exitButton(_ sender: Any) {
        exit(0)
    }
    func setOutput(){
        
        do {
            // get the documents folder url
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                // create the destination url for the text file to be saved
                let fileURL = documentDirectory.appendingPathComponent("output.txt")
                
                let savedText = try String(contentsOf: fileURL)
                
                if let number = Int(savedText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
                    // Do something with this number
                    wordCount.text = "\(number)"
                }
                
               // print("savedText ProgressReport:", savedText)   // "Hello World !!!\n"
                //wordCount.text = number
                meanLengthUtterance.text = "mlu"
                numOfQ.text = "numOfQ"
                timeElasped.text = "time"
            }
        } catch {
            print("error:", error)
        }
        
        
       // wordCount.text = savedText
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
