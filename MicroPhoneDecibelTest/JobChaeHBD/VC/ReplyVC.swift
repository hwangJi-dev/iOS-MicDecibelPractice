//
//  ReplyVC.swift
//  JobChaeHBD
//
//  Created by 황지은 on 2021/06/22.
//

import UIKit
import MessageUI
import KakaoSDKTemplate
import KakaoSDKLink

class ReplyVC: UIViewController, UITextViewDelegate {

    var selectedTimiName:String = UserDefaults.standard.string(forKey: "selectedTimiName")!
    var selectedTimiPhone:String = UserDefaults.standard.string(forKey: "selectedTimiPhone")!
    @IBOutlet var letterToLabel: UILabel!
    @IBOutlet var replayView: UIView!
    @IBOutlet var replyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letterToLabel.text = "To. " + selectedTimiName
        replayView.layer.cornerRadius = 20
    }
    
    //Return 눌렀을 때 키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //화면 터치시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func touchUpToBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func touchUpToMessageBtn(_ sender: UIButton) {
        let messageComposer = MFMessageComposeViewController()
        messageComposer.messageComposeDelegate = self
        if MFMessageComposeViewController.canSendText(){
            messageComposer.recipients = [selectedTimiPhone]
            messageComposer.body = replyTextView.text
            messageComposer.modalPresentationStyle = .currentContext
            self.present(messageComposer, animated: true)
        }
    }
    
    @IBAction func touchUpToKakaotalkBtn(_ sender: UIButton) {
        
                let template = TextTemplate.init(text: replyTextView.text ?? "안녕하세요", link: Link(), buttonTitle: "990624 채정아 탄신일 축하하러 가기", buttons: nil)
        
        
                // 카카오링크 실행
                LinkApi.shared.defaultLink(templatable: template) {(linkResult, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("defaultLink() success.")
        
                        if let linkResult = linkResult {
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                        }
                    }
                }
    }
    
}

extension ReplyVC: MFMessageComposeViewControllerDelegate{
    /// 메시지 전송 결과
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case MessageComposeResult.sent:
            print("전송 완료")
            break
        case MessageComposeResult.cancelled:
            print("취소")
            break
        case MessageComposeResult.failed:
            print("전송 실패")
            break
        @unknown default:
            fatalError()
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
