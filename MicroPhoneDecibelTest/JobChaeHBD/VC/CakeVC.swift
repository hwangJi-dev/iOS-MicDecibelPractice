//
//  CakeVC.swift
//  JobChaeHBD
//
//  Created by 황지은 on 2021/06/22.
//

import Foundation
import UIKit
import AVFoundation
import CoreAudio

class CakeVC: UIViewController {
    
    var recorder: AVAudioRecorder!
    var levelTimer = Timer()
    var blowingCnt:Int = UserDefaults.standard.integer(forKey: "blowingCnt")
    let LEVEL_THRESHOLD: Float = -3.0
    
    
    @IBOutlet var dearChaeLabel: UILabel!
    @IBOutlet var birthLabel: UILabel!
    @IBOutlet var celebrateLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var candleDescLabel: UILabel!
    @IBOutlet var blowCountLabel: UILabel!
    @IBOutlet var eventLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAnimate()
        makeAudioSession()
        blowCountLabel.text = "\(blowingCnt)"
        // Do any additional setup after loading the view.
    }
    
    func makeAnimate() {
        
        dearChaeLabel.alpha = 0
        birthLabel.alpha = 0
        celebrateLabel.alpha = 0
        descLabel.alpha = 0
        candleDescLabel.alpha = 0
        blowCountLabel.alpha = 0
        
        UIView.animate(withDuration: 1.0, animations:
                        {
                            self.dearChaeLabel.alpha = 1.0
                            self.view.layoutIfNeeded()
                        },completion: {finished in
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                self.birthLabel.alpha = 1.0
                                self.view.layoutIfNeeded()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                self.celebrateLabel.alpha = 1.0
                                self.view.layoutIfNeeded()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                self.descLabel.alpha = 1.0
                                self.view.layoutIfNeeded()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                self.candleDescLabel.alpha = 1.0
                                self.blowCountLabel.alpha = 1.0
                                self.view.layoutIfNeeded()
                            }
                        })
    }
    
    func makeAudioSession() {
        let documents = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
        let url = documents.appendingPathComponent("record.caf")
        
        let recordSettings: [String: Any] = [
            AVFormatIDKey:              kAudioFormatAppleIMA4,
            AVSampleRateKey:            44100.0,
            AVNumberOfChannelsKey:      2,
            AVEncoderBitRateKey:        12800,
            AVLinearPCMBitDepthKey:     16,
            AVEncoderAudioQualityKey:   AVAudioQuality.max.rawValue
        ]
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
            try audioSession.setActive(true)
            try recorder = AVAudioRecorder(url:url, settings: recordSettings)
            
        } catch {
            return
        }
        
        recorder.prepareToRecord()
        recorder.isMeteringEnabled = true
        recorder.record()
        
        levelTimer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(levelTimerCallback), userInfo: nil, repeats: true)
        
    }
    
    @objc func levelTimerCallback() {
        recorder.updateMeters()
        
        let level = recorder.averagePower(forChannel: 0)
        let isLoud = level > LEVEL_THRESHOLD
        
        if isLoud {
            print("blow")
            blowingCnt += 1
            blowCountLabel.text = "\(blowingCnt)"
            UserDefaults.standard.set(blowingCnt, forKey: "blowingCnt")
        }
        
        if blowingCnt == 1000 {
            eventLabel.text = "채정아 1000번 분 것 축하해!"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpToCardViewBtn(_ sender: UIButton) {
        //뷰 전환
        let letterVC = (self.storyboard?.instantiateViewController(identifier: "LetterVC"))! as LetterVC
        self.navigationController?.pushViewController(letterVC, animated: true)
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
