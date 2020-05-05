//
//  GameViewController.swift
//  swift3_game_development
//
//  Created by Ally Feldmeier on 12/5/19.
//  Copyright © 2019 Ally Feldmeier. All rights reserved.
//


import UIKit
import SpriteKit
import GameplayKit
import Speech


class GameViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    var gameScene : GameScene!
    var n = 2

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //super.viewDidLoad()
        //what makes GaveViewController.swift(this class) communicate with GameScene.swift
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .resizeFill // Set the scale mode to scale to fit the window
                scene.size = view.bounds.size // Size our scene to fit the view exactly
                view.presentScene(scene) // Show the new scene:
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
/// move variable declarations to top once working
   
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var microphoneButton: UIButton!

    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))!
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    //variables for labels which text gets set to on the asteroids
    var labelQ:UILabel!
    var label0:UILabel!
    var label1:UILabel!
    var label2:UILabel!
    var label3:UILabel!
    var label4:UILabel!
    var label5:UILabel!
    var label6:UILabel!
    var label7:UILabel!
    var label8:UILabel!
    var label9:UILabel!
    var Q = ""
    var level = ""
    var savedQ = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // saveLevel()
        print("before anything level should be nothing")
        print(level)
        //Setting up labels for question label and individual asteroid labels
        labelQ = UILabel(frame: CGRect(x:50,y: 100,width: 1500,height: 75))
        labelQ.textAlignment = NSTextAlignment.left
        labelQ.textColor = .white
        labelQ.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        if(level == ""){
            do {
            // get the documents folder url
                if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    // create the destination url for the text file to be saved
                    let fileURL = documentDirectory.appendingPathComponent("level.txt")
                    let savedLevel = try String(contentsOf: fileURL)
                    if(savedLevel == "easy"){
                        level = savedLevel
                    }
                    if(savedLevel == "medium"){
                        level = savedLevel
                    }
                    if(savedLevel == "hard"){
                        level = savedLevel
                    }
                    print("pulling level from file: ")
                    print(level)
                }
            } catch {
                print("error:", error)
            }
        }
    
//        if let path = Bundle.main.path(forResource: "repeatQ", ofType: "txt") {
//            do {
//                let data = try String(contentsOfFile: path, encoding: .utf8)
//                let repeatedQ = data.components(separatedBy: .newlines)
//                savedQ = repeatedQ[0]
//            } catch {
//                    print("Ooops! Something went wrong reading text file: \(error)")
//            }
//
//            if(savedQ != ""){
//                labelQ.text = savedQ
            if let path = Bundle.main.path(forResource: "questions", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                var randomQ = 0
                
                if(level == "easy"){
                    randomQ = Int.random(in: 0 ... 98)//pick random number 1 through 298, 298 bc thats how many options in array from reading in text file
                }
                if(level == "medium"){
                    randomQ = Int.random(in: 100 ... 198)//pick random number 1 through 298, 298 bc thats how many options in array from reading in text file
                }
                if(level == "hard"){
                    randomQ = Int.random(in: 200 ... 298)//pick random number 1 through 298, 298 bc thats how many options in array from reading in text file
                }
                
                if(randomQ % 2 == 0){//questions are only in even indicies in array
                    labelQ.text = myStrings[randomQ]
                }else{
                    labelQ.text = myStrings[randomQ+1]//if not even, add one to make it even
                }
                saveLevel()


            } catch {
                print("Ooops! Something went wrong reading text file: \(error)")
            }
        }
    
        self.view.addSubview(labelQ)
        
        //adding individual label containers for asteroids
        label0 = UILabel(frame: CGRect(x:50,y: 225,width: 150,height: 75))
        label0.textAlignment = NSTextAlignment.center
        label0.textColor = .black
        label0.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label0.text = ""
        self.view.addSubview(label0)
        
        label1 = UILabel(frame: CGRect(x:250,y: 275,width: 150,height: 75))
        label1.textAlignment = NSTextAlignment.center
        label1.textColor = .black
        label1.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label1.text = ""
        self.view.addSubview(label1)
        
        label2 = UILabel(frame: CGRect(x:450,y: 225,width: 150,height: 75))
        label2.textAlignment = NSTextAlignment.center
        label2.textColor = .black
        label2.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label2.text = ""
        self.view.addSubview(label2)
        
        label3 = UILabel(frame: CGRect(x:650,y: 275,width: 150,height: 75))
        label3.textAlignment = NSTextAlignment.center
        label3.textColor = .black
        label3.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label3.text = ""
        self.view.addSubview(label3)
        
        label4 = UILabel(frame: CGRect(x:850,y: 225,width: 150,height: 75))
        label4.textAlignment = NSTextAlignment.center
        label4.textColor = .black
        label4.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label4.text = ""
        self.view.addSubview(label4)
        
        label5 = UILabel(frame: CGRect(x:50,y: 425,width: 150,height: 75))
        label5.textAlignment = NSTextAlignment.center
        label5.textColor = .black
        label5.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label5.text = ""
        self.view.addSubview(label5)
        
        label6 = UILabel(frame: CGRect(x:250,y: 475,width: 150,height: 75))
        label6.textAlignment = NSTextAlignment.center
        label6.textColor = .black
        label6.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label6.text = ""
        self.view.addSubview(label6)
        
        label7 = UILabel(frame: CGRect(x:450,y: 425,width: 150,height: 75))
        label7.textAlignment = NSTextAlignment.center
        label7.textColor = .black
        label7.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label7.text = ""
        self.view.addSubview(label7)
        
        label8 = UILabel(frame: CGRect(x:650,y: 475,width: 150,height: 75))
        label8.textAlignment = NSTextAlignment.center
        label8.textColor = .black
        label8.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label8.text = ""
        self.view.addSubview(label8)
        
        label9 = UILabel(frame: CGRect(x:850,y: 425,width: 150,height: 75))
        label9.textAlignment = NSTextAlignment.center
        label9.textColor = .black
        label9.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label9.text = ""
        self.view.addSubview(label9)
        //
        
        labelQ.isHidden = false//question not hidden initally
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
            //set up asteroids and rocket images
            var asteroidImage0: UIImageView?
            var asteroidImage1: UIImageView?
            var asteroidImage2: UIImageView?
            var asteroidImage3: UIImageView?
            var asteroidImage4: UIImageView?
            var asteroidImage5: UIImageView?
            var asteroidImage6: UIImageView?
            var asteroidImage7: UIImageView?
            var asteroidImage8: UIImageView?
            var asteroidImage9: UIImageView?
            var rocketImage: UIImageView?
            
            let rocket : UIImage = UIImage(named:"rocket")!
            rocketImage = UIImageView(image: rocket)
            rocketImage?.frame = CGRect(x: 475, y: 600, width: 100, height: 150)
            self.view.addSubview(rocketImage!)
            
            let asteroid : UIImage = UIImage(named:"asteroid")!
            asteroidImage0 = UIImageView(image: asteroid)
            asteroidImage0?.frame = CGRect(x: 50, y: 200, width: 150, height: 150)//0
            self.view.addSubview(asteroidImage0!)
            //1
            asteroidImage1 = UIImageView(image: asteroid)
            asteroidImage1?.frame = CGRect(x: 250, y: 250, width: 150, height: 150)//1
            self.view.addSubview(asteroidImage1!)
            //2
            asteroidImage2 = UIImageView(image: asteroid)
            asteroidImage2?.frame = CGRect(x: 450, y: 200, width: 150, height: 150)//2
            self.view.addSubview(asteroidImage2!)
            //3
            asteroidImage3 = UIImageView(image: asteroid)
            asteroidImage3?.frame = CGRect(x: 650, y: 250, width: 150, height: 150)//3
            self.view.addSubview(asteroidImage3!)
            //4
            asteroidImage4 = UIImageView(image: asteroid)
            asteroidImage4?.frame = CGRect(x: 850, y: 200, width: 150, height: 150)//4
            self.view.addSubview(asteroidImage4!)
            //5  bgImage?.frame = CGRect(x: 25, y: 375, width: 200, height: 200)
            asteroidImage5 = UIImageView(image: asteroid)
            asteroidImage5?.frame = CGRect(x: 50, y: 400, width: 150, height: 150)//5
            self.view.addSubview(asteroidImage5!)
            //6
            asteroidImage6 = UIImageView(image: asteroid)
            asteroidImage6?.frame = CGRect(x: 250, y: 450, width: 150, height: 150)//6
            self.view.addSubview(asteroidImage6!)
            //7
            asteroidImage7 = UIImageView(image: asteroid)
            asteroidImage7?.frame = CGRect(x: 450, y: 400, width: 150, height: 150)//7
            self.view.addSubview(asteroidImage7!)
            //8
            asteroidImage8 = UIImageView(image: asteroid)
            asteroidImage8?.frame = CGRect(x: 650, y: 450, width: 150, height: 150)//8
            self.view.addSubview(asteroidImage8!)
            //9
            asteroidImage9 = UIImageView(image: asteroid)
            asteroidImage9?.frame = CGRect(x: 850, y: 400, width: 150, height: 150)//9
            self.view.addSubview(asteroidImage9!)
            
            
        }
        //if(microphoneButton != nil){
            microphoneButton.isEnabled = false
        //}
        speechRecognizer.delegate = self
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            var isButtonEnabled = false
            
            switch authStatus {
            case .authorized:
                isButtonEnabled = true
                
            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognition")
                
            case .restricted:
                isButtonEnabled = false
                print("Speech recognition restricted on this device")
                
            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition not yet authorized")
            }
            
            OperationQueue.main.addOperation() {
                self.microphoneButton.isEnabled = isButtonEnabled
            }
        }
    }

    @IBAction func stepperForQ(_ sender: Any) {
       // n = n+2
        //func viewDidLoad()
       // print(n)
    }
    
    @IBAction func microphoneTapped(_ sender: Any) {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            microphoneButton.isEnabled = false
            microphoneButton.setTitle("Start Recording", for: .normal)
        } else {
            startRecording()
            microphoneButton.setTitle("Stop Recording", for: .normal)
        }
    }
    
    func startRecording() {
    
    
        
        if recognitionTask != nil {  //1
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()  //2
        do {
            try audioSession.setCategory(AVAudioSession.Category.record)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true)// withFlags: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()  //3
        
        let inputNode = audioEngine.inputNode;// else {
         //   fatalError("Audio engine has no input node")
        //}
        //else do {
        //    fatalError("Audio engine has no input node")
       // }  //4
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        } //5
        
        recognitionRequest.shouldReportPartialResults = true  //6
        
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in  //7
            
            var isFinal = false  //8
            
            if result != nil {
                //output text from voice input to screen in labelQ
                print(result?.bestTranscription.formattedString)//printing to console
                //finding how many words are spoken
                let voiceToTextOutput = result?.bestTranscription.formattedString//voice to text
                let components = voiceToTextOutput?.components(separatedBy: .whitespacesAndNewlines)//seperate array by white spaces and newline characters
                let numOfWords = components?.filter { !$0.isEmpty }//numOfWords.count keeps track of how many words have been said
                print(numOfWords?.count)
                
                let splitStringArray = voiceToTextOutput?.split(separator: " ").map({ (substring) in//splitting input sentence into an array with a single word in each loation
                    return String(substring)//returns subString so cast to a String
                })
                var i = 0;//iterator
                //
                var fbImage: UIImageView?//ImageView fireball variable
                let fireball : UIImage = UIImage(named:"fireball")!// set fireball image
                fbImage = UIImageView(image: fireball)//set fireball image to fireball ImageView
    
                //loop to fill in labels as person is talking
                while(i != numOfWords?.count ?? 0 ){//while count of words isn't zero
                    if(splitStringArray?[0] != nil){ //first word, index zero of splitStringArray isn't nil
                       
                        i+=1;//counter
                        fbImage?.frame = CGRect(x: 20, y: 175, width: 200, height: 200)//image location and size
                        self.view.addSubview(fbImage!)//add to subview
                        self.view.addSubview(self.label0)//add label0 to subview after(to be on top of image)
                       // self.label0.bringSubviewToFront(self.label0)
                        self.label0.text = splitStringArray?[0]//add word spoken to label
                        if( i == numOfWords?.count){//if last word spoken; break out of while loop
                            break
                        }
                    }
                    if(splitStringArray?[1] != nil){
                        i+=1;
                        fbImage?.frame = CGRect(x: 220, y: 225, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label1)
                        //self.label1.bringSubviewToFront(self.label1)
                        self.label1.text = splitStringArray?[1]
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                    if(splitStringArray?[2] != nil){
                      
                        fbImage?.frame = CGRect(x: 420, y: 175, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label2)
                       // self.label2.bringSubviewToFront(self.label2)
                        self.label2.text = splitStringArray?[2]
                        i+=1;
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                    if(splitStringArray?[3] != nil){
                       
                        fbImage?.frame = CGRect(x: 620, y: 225, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label3)
                       // self.label3.bringSubviewToFront(self.label3)
                        self.label3.text = splitStringArray?[3]
                        i+=1;
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                    if(splitStringArray?[4] != nil){
                      
                        fbImage?.frame = CGRect(x: 820, y: 175, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label4)
                       // self.label4.bringSubviewToFront(self.label4)
                        self.label4.text = splitStringArray?[4]
                        i+=1;
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                    if(splitStringArray?[5] != nil){
                        
                        fbImage?.frame = CGRect(x: 20, y: 375, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label5)
                      //  self.label5.bringSubviewToFront(self.label5)
                        self.label5.text = splitStringArray?[5]
                        i+=1;
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                    if(splitStringArray?[6] != nil){
                    
                        fbImage?.frame = CGRect(x: 220, y: 425, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label6)
                       // self.label6.bringSubviewToFront(self.label6)
                        self.label6.text = splitStringArray?[6]
                        i+=1;
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                    if(splitStringArray?[7] != nil){
                        fbImage?.frame = CGRect(x: 420, y: 375, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label7)
                     //   self.label7.bringSubviewToFront(self.label7)
                        self.label7.text = splitStringArray?[7]
                        //self.label7.text = splitStringArray?[7]
                        i+=1;
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                    if(splitStringArray?[8] != nil){
                        fbImage?.frame = CGRect(x: 620, y: 425, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label8)
                      //  self.label8.bringSubviewToFront(self.label8)
                        self.label8.text = splitStringArray?[8]
                       // self.label8.text = splitStringArray?[8]
                        i+=1;
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                    if(splitStringArray?[9] != nil){
                        fbImage?.frame = CGRect(x: 820, y: 375, width: 200, height: 200)
                        self.view.addSubview(fbImage!)
                        self.view.addSubview(self.label9)
                      //  self.label9.bringSubviewToFront(self.label9)
                        self.label9.text = splitStringArray?[9]
                        //self.label9.text = splitStringArray?[9]
                        i+=1;
                        if( i == numOfWords?.count){
                            break
                        }
                    }
                }
                isFinal = (result?.isFinal)!
                
                do {
                    // get the documents folder url
                    if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                        // create the destination url for the text file to be saved
                        let fileURL = documentDirectory.appendingPathComponent("output.txt")
                        // define the string/text to be saved
                       // "\(x)"
                        let text = "\(numOfWords?.count)"//"Hello World !!!"
                        print(text.description)
                        // writing to disk
                        // Note: if you set atomically to true it will overwrite the file if it exists without a warning
                        try text.write(to: fileURL, atomically: false, encoding: .utf8)
                       // print("saving was successful")
                        // any posterior code goes here
                        // reading from disk
                //        let savedText = try String(contentsOf: fileURL)
                //        print("savedText:", savedText)   // "Hello World !!!\n"
                //        documentDirectory.closeFile()
                    }
                } catch {
                    print("error:", error)
                }
                
            }
            
            if error != nil || isFinal {  //10
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.microphoneButton.isEnabled = true
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)  //11
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()  //12
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
        
        //textView.isHidden = false;
        //self.textView.bringSubviewToFront(self.textView)
        textView.text = "Say something, I'm listening!"
        
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            microphoneButton.isEnabled = true
        } else {
            microphoneButton.isEnabled = false
        }
    }
    
    func saveLevel(){
        do {
            // get the documents folder url
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            // create the destination url for the text file to be saved
            let fileURL = documentDirectory.appendingPathComponent("level.txt")

            let text = "\(level)"
            print("in saveLevel...")
            print(text)
            // writing to disk
            // Note: if you set atomically to true it will overwrite the file if it exists without a warning
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
            // print("saving was successful")
            //        let savedText = try String(contentsOf: fileURL)
            //        print("savedText:", savedText)   // "Hello World !!!\n"
            //        documentDirectory.closeFile()
                           }
        } catch {
                print("error:", error)
        }
    }
    
//    @IBAction func repeatQuestion(_ sender: Any) {
//       // labelQ.text
//        do{
//        // get the documents folder url
//            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            // create the destination url for the text file to be saved
//            let fileURL = documentDirectory.appendingPathComponent("repeatQ.txt")
//
//            let text = "\(String(describing: labelQ.text))"
//
//            try text.write(to: fileURL, atomically: true, encoding: .utf8)
//            }
//        } catch{
//                print("error:", error)
//        }
//
//    }
}

