//
//  LetterVC.swift
//  JobChaeHBD
//
//  Created by 황지은 on 2021/06/22.
//

import UIKit

class LetterVC: UIViewController {

    // 페이징 관련 index 정의 변수
    private var indexOfCellBeforeDragging = 0
    var letterArray:[LetterData] = []
    
    @IBOutlet var letterCV: UICollectionView!
    @IBOutlet var letterPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLetterData()
        letterCV.delegate = self
        letterCV.dataSource = self
        letterCV.layer.cornerRadius = 20
    }
    
    func makeLetterData() {
        letterArray.append(contentsOf: [
                            LetterData(writtenBy: "지은", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
                LetterData(writtenBy: "서현", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "현아", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "지수", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "주현", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "성현", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "인우", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "주현", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "호영", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "민재", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "지윤", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "송현", letter: "사정아야 생일 축하해♥ 운팀 면접에서 널 처음보고, 번개에서 술 마신게 엊그제 같은데... 벌써 정아 생일에, 앱잼이라니 시간이 너무 빠른거 같아....  정아 탄신 23주년을 기념해서 삼행시 써볼게\n\n채 : 채우고 싶어...\n정 : 정말 안되겠니...?\n아 : 아름다워 질거야... 채정아 너로 세상을 가득 채운다면 말이야", phoneNum: "01093013163"),
            LetterData(writtenBy: "세린", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163"),
            LetterData(writtenBy: "민영", letter: "사랑해사랑해사랑해사랑해사랑해사랑해사랑해ㅍㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해\n사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해vv사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해v사랑해사랑해사랑해ㅍ사랑해사랑해사랑해사랑해ㅍ사랑해", phoneNum: "01093013163")
        ])
        letterPageControl.numberOfPages = letterArray.count
    }

    // Left Paging (오른쪽으로 넘길 때)
    private func indexOfMajorCell() -> Int {
        let itemWidth = letterCV.frame.width
        let proportionalOffset = (letterCV.contentOffset.x / itemWidth)+0.3
        let index = Int(round(proportionalOffset))
        let safeIndex = max(0, min(letterArray.count, index))
        return safeIndex
    }
    
    // Right Paging (왼쪽으로 넘길 때)
    private func indexOfBeforCell() -> Int {
        let itemWidth = letterCV.frame.width
        let proportionalOffset = (letterCV.contentOffset.x / itemWidth)
        let back_index = Int(floor(proportionalOffset))
        let safeIndex = max(0, min(letterArray.count - 1, back_index))
        return safeIndex
    }
    

    @IBAction func touchUpToBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension LetterVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letterArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let letterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LetterCVCell", for: indexPath) as! LetterCVCell
        letterCell.letterContentTextView.text = letterArray[indexPath.row].letter
        letterCell.writtenByLabel.text = letterArray[indexPath.row].writtenBy
        
        return letterCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 317, height: 536)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

//MARK: - collectionView Horizontal Scrolling Magnetic Effect 적용
extension LetterVC: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        indexOfCellBeforeDragging = indexOfMajorCell()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        if velocity.x > 0 {
            let indexOfMajorCell = self.indexOfMajorCell()
            let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
            letterCV.collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }else{
            let indexOfBeforCell = self.indexOfBeforCell()
            
            let indexPath = IndexPath(row: indexOfBeforCell, section: 0)
            letterCV.collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
    //MARK: - scroll animation이 끝나고 적용되는 함수
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let indexOfMajorCell = self.indexOfMajorCell()
        let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
        // scrollAnimation이 끝나고 pageControl의 현재 페이지를 animation이 끝난 상태값으로 바꿔준다.
        letterPageControl.currentPage = Int(round(letterCV.contentOffset.x / letterCV.frame.size.width))
    }
}
