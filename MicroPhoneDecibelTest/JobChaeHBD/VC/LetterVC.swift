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
    @IBOutlet var jungGalBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLetterData()
        letterCV.delegate = self
        letterCV.dataSource = self
        letterCV.layer.cornerRadius = 20
        jungGalBtn.layer.cornerRadius = 13
    }
    
    func makeLetterData() {
        letterArray.append(contentsOf: [
                            LetterData(writtenBy: "지은", letter: "아웅.. 정아야 생일 너무 축하한다 >< 우리 너 생일 준비하다가 앱 만들어주자는 의견이 나와가지구 노션에다가 롤링페이퍼를 쓰던 전통에서 벗어나서 JABCHAEHBD 앱을 만들어봤어 ㅎㅎㅋㅋㅋㅋㅋ 맘에 드는 생일선물이 되었으면 좋겠다 :-) 이거 읽고 개개인 편지 들어가서 답장도 써야된다 알겠찌? ㅋㅋㅋㅋㅋㅋㅋ 🥳\n\n정아야 28기 운팀으로 너가 들어와줘서, 우리가 함께하게 돼서 나는 정말 큰 행운을 얻었다고 생각해. 첫 회의때부터 그리구 우리 티미 단톡방에서 가장 말 많이 하면서 우리 분위기 띄워주고 일할 때는 정말 적재적소에서 훌륭한 피드백과 의견을 줘서 이번 우리 우녕팀이 더 성공적이게 됐지 않았나 싶다. 🌱🌱 너랑 사적으로 만나서 놀 때면 낯가리는 내가 어느샌가 너무 신나게 동화되어 놀고있더라구 진짜 그만큼 너가 있으면 어느 곳에서든 어색하지 않은 분위기, 좋은 모임이라는게 필수로 성립되는 것 같아 그리구 주변에서도 나 진짜 너 얘기 엄청 많이 들었거던.. >< 28기 솝트 초반부터 운영팀에 그 정아님? 뭐 한자리 하실 것 같다고 ㅋㅋㅋㅋㅋ 너 얘기랑 칭찬을 너무 많이 들어서 내가 뿌듯하면서도 역으로 너한테 의지도 짱 많이 해쑴! ㅎㅎㅋㅋ💙 진짜 운영팀 하면서 너라는 좋은 친구, 좋은 사람을 만나게 돼서 난 너무너무 행복하당 정아야 우리 앞으로도 오래 보자 진짜로 꼭.\n\nHBD 잡채씨 오늘 정말 행복한 하루 보내고, 조만간 만나서 우리 너 생일파티도 오프로 하자고🕺🏻💃 그날은 또 우리 다 디져야징 ㅎㅎ 앙? 리치 한번 더 ㄱ ㄱ. 오늘은 세상에서 가장 행복한 사람이 되길💙 채정아 사랑해 생일 축하해💙🥳🎂", phoneNum: "01093013163"),
                LetterData(writtenBy: "서현", letter: "정아야 안녕 ㅎ 우리의 계획 상으로 지금쯤 너가 오열하고 있어야하는데 어때? 안구 좀 촉촉해졌니? 예원이 생일날 여우골에서 급하게 1차행사 숙제하면서 앱잼~ 탕진잼~하던게 엊그제 같건만 .. 벌써 앱잼이 코앞이고 벌써 정아 생일이라니 참 시간이 빠르다 ,, 롤페에서도 말했지만 (나만 알았던) 학연에서 오는 내적친밀감이랑 이런 저런 이유로 너랑 친해지고 싶었어 헷 그래서 초면에 장난도 많이 치고 갈기기도 하고 그랬는데 불편하진 않았나 모르겠다 ^_ㅠ 나는 운팀에서 너를 만나서 너무 좋아 ~ 아 맞아 지금 새벽 3시거던? 감성 이해 부탁 ;; 팔색조 정아 ,, 1차행사 잡화점 아이디어부터 스토리라인 같이 짜면서도 개쩌는 아이디어 많이 내줘서 아 기획 짬밥이 이런건가 느끼게 해줬었지 .. 오프로 처음 만났을 때도 나와 갈겨주던 너 ,, 그리고 같이 뒤지긴 했지만 ><,, 우리 톡방에서도 이상한 밸런스 게임으로 활기 넘치게 하고 내 근본없는 드립 잘 받아줘서 고마웠다 ㅋ 알고리즘으로는 숙대 때려눕혔고 개발도 쩐다는 얘기 많이 들었는데 너 진짜 제법 멋쟁이 토마토네 .. 아 서팟장 계획도 있담서 나 서버하고시퍼 ~,, 아니 생일 편진데 새벽이라 말이 많아진다 야 ,,, 생일 축하한닥 정아야!!!! 앱잼 시작하고 생일이면 더더더더 축하 많이 받을텐데 조곰 아쉽다 ,, 하긴 뭐 안그래도 넌 삽인싸니까 그리고 우리가 있으니까 큭 암튼 정아야 너랑 더 친해지고싶어 너에게 선택권은 없삼! 나랑도 요호가 ㅡㅡ 나랑 한번 더 갈겨 ㅡㅡ 담학기엔 너도 복학하니까 솝트에서도 학교에서도 종종 보자 ,, 웅 ..? 정아야 ,, 슴세번째 생일을 축하한다 ~ 오늘 맛있는거 많이 먹고 술도 많이 먹고(?) 반가운 사람들한테 축하도 많이 받구 여튼 잔잔한 행복이 가득한 하루 되길 바라 빠잉!", phoneNum: "01075579551"),
            LetterData(writtenBy: "현아", letter: "얘 정아야 항상 너의 주변을 맴돌 .. 고 싶어서 볼 때마다 틱틱틱틱 탱탱탱탱 팅팅 탱탱 후라이팬놀이. 틱틱대는 현아다. 울 정아의 마음이 카핀이 아니라 다른곳에 있어두...괜찮아 난. ,, 개발자 넷월킹 때 들러준 것만으로도 감사해^^,, 꼭 들어가고 싶은데가서 즐거웁게 개발자 잉생을 즐기길 바ㄹr ,, 그게아니고정아야 생일축하해 나 약간 운팀애기덜 쁘띠해가지구 매운맛즈 좀 모아가지구 톡톡 하고싶거덩. 우리가 조금 모아보자. 나와 같은맘인ㅇ거다알아. 그리고 우리왜 사석에서 못보니..? ㄹ로비정도는 해야 너와 방탈출 갈 수 있는거니 근데 정아야 나 태어나서 한 번도 방탈출 해본적없다 나같은 찐따좀 데리고 가줄래 .. 너가튼 사람이 운팀에 있어서 촴 다행이라고 생각한다 난 아직도 지난날 ㅂㅓ섯샤브샤브 칼국수 같이조진날이 생생해 도레미 왜안뭉쳐(미안해) 혹시나한테 정떨어진건 아니지..? 나 소심한데 N이라 상상 대기권뚫거든 .. 암튼 머 난 너 좋아 알지? 생일튜카해 진차 행복하자~~~~", phoneNum: "01027333965"),
            LetterData(writtenBy: "지수", letter: "티오. 채투더정투더아\n\n증아야,,, 우리가 함께한지 어언 3달이 넘어간다,,, 너랑 운팀와서 억죄방으로 첫 인연을 맺었었지,,, 그때 너랑 현아랑 99즈 도레미했던 게 나한테는 정말이지 무척이나 좋은 추억으로 남아있는데,,, 너한테도 그러려나,,,,? 모쪼록 그랬으면 좋겠다,,,\n쓰고보니 말투가 갱장히 아련한데 그런거 아니구 너 생일 무진장무진장 축하한단 뜻이야~^~ 아 맞아 너 그리고 울 아부지랑 생일 똑같음 6월 24일! 너가 영광인건지 울 아부지가 영광인건지 알다가도 모르겠지마는 난 두 생일 모두 왕창창 축하해🎉\n28기 운팀으로서의 활동은 비록 마무리되었지만.. 어? 우리 좋았잖아 어? 오래가자 어? 나만 앱잼 안한다고 또 나만 쏙 빼놓고 재미있게 놀지 말고 어? 뉴 앱잼 팀 만났다고 우리 귀여운 티미들 홀랑 잊어묵지 말고 어?\n아니~ 뭐~ 사랑한단 뜻이야~\n다시한번 증아야 너의 스물세번째 생일 진짜 너무엄청완전대박무지막지축하하고 행복마아아안땅한 하루 보냈으면 좋겠다잉\n해 피 벌 쓰 데 이 채 정 아 💜", phoneNum: "01066105082"),
            LetterData(writtenBy: "성현", letter: "TO 잡채정아\n\n얘정아야 생일 축하한다 정아야 사랑한다\n몇번 보진 않았지만, 나는 너가 넘 좋아 (이건 운명?) 진중한 사람이라고 했으니까 더 destiny 🦍 알지 내마음~? 집도 가까우니까 부르면 나오셈 ㅋ 앱잼 끝나고도 자주 봐야됨 ㅋ 정아야 평생 개발자해줘 멋있으니께. 운팀은 forever~! 채정아랑 나도 forever~!\n\n취취취정아 담에 맛있는거 먹자 미뇽이랑도 갈겨 (하트)", phoneNum: "01063635877"),
            LetterData(writtenBy: "인우", letter: "정아 자기야 생일축하 갈길게. 나는 정아가 너무너무 좋아하는 이누야. 내 롤페에 써줬던것처럼 우리 제법 코드가 맞는것같은데 제대로 갈긴적이 없어서 너무 아쉽다:-) 그렇지만 실망은 말아줘. 왜냐면 난 너에게 질척거릴거니까. 자기야 난 그리고 호정코인 밀지만 인정코인 대주주야. 그러니까 우리 코인 떡상시켜보자💛 아무튼 자기 코딩하는모습 간지작살이더라.. 이런말 요즘애들은 안쓰나? 알겠어., 일단 생일이니까 생일주 잘 갈기구 운팀 회의때 자는건 용서못해. 사랑해🔥", phoneNum: "01099137953"),
            LetterData(writtenBy: "주현", letter: "운팀에 서버파트에 솝탁에 비록 내가 탈주했지만 필카 스터디까지,, 이정도면 우리 운명일까 •••\n정아씌 생일 축하해 ❤️‍🔥 난 선배가 살짝 설렜어 출 때 그르케 좋더라 ㅎㅎ 언니랑 갈길 상황은 좀 많았는데 내가 늘 안갈겨서 미안한 마음뿐 .. 나도 방탈출 몇 번 해봤어 나랑 같이 가자 무서운 거 빼고 재밌는 걸루다가 혹시 그 용산인가? 집탈출알아? 역에서 시작하는 건데 우리 그거 하러 가자🔥 나 동대문 가깝.. 멀기도 하지만 나름 가까우니까 동대문 언니가 맛집이라고 했던 데도 가자 준비 완료\n\n나 언니랑 .. 같이 앱잼하고 싶은데.. 리드 개발자 정아 ... 뽀뽀갈겨 그리구 담 기수 서팟장... 기대된다 나 진짜 언니 코딩하는 거 멋져서 코피나 ;;; 혹시 진짜 하면 나도 예쁘게 봐주구 .. 우리 오래오래 친하게 지내자 .. 알랍유 생일 축하해 ♥️", phoneNum: "01039502471"),
            LetterData(writtenBy: "호영", letter: "Mr 정\n안녕 정아. 난 너와의 호정 코인을 담당하고있는 Magician.Ho라고 해. 너의 생일을 진심으로 축하하는 바야. 비록 우리가 같은 팀이 되거나 같은 자리에 앉아본 경험이라고는 고작 그 뭐야 그 갑자기 기억이안나냐.. 아 그 단체회의 전 볶음밥먹었던 그 자리밖에 없었지만, 아 2차행사 뒤풀이로 만취한 너를 그윽히 사진촬영한 그 기회밖에 없었지만.. 우리는 꽤 많이 가까워졌다고 생각한다... 너가 다음기수 섭팟장 한다는 얘기를 들었거든.. 나 다음기수 오비로 서버 지원해볼까 하는데 .. 미안 농담이고.. 다음기수 당연히 둘다 할 거니까 우린 오래 보게 될거야... 그때까지 호정코인 떡락시키지말고 오래오래 가보도록 하자 ㅎㅎ 생일축하한다!!!!!!!\nFrom. Magician Ho", phoneNum: "01031048447"),
            LetterData(writtenBy: "민재", letter: "정아선배 생일축하합니다~!! 항상 만나자고는 하지만 만날 기회가 없는것 같아서 매우 안타깝고 새드한 마음뿐입니다. 앱잼이 끝나면 꼭 같이 밥을 갈기든 술을 갈기든 했으면 좋겠습니다. 아 술은 제가 별로 안좋아해서 밥먹으면 더 좋을것 같습니다. 어디든지 밥이라면 달려갈 전비 되어있습니다. 아 그리고 다음 기수 섭파짱을 하게된다는 소문이 모락모락 퍼지고 있습니다. 저도 담 기수를 서버는 아니지만, 아요로 하게 될거 같으니 꼭 지금보다 더 친해지려 노력하겠습니다. 잘부탁드립니다(?) 다른분들이 다 코인 얘기를 해서 저는 따로 언급하지 않고 넘어가겠습니다. 아 근데 이 편지 생일이라서 쓴거니깐 생일축하하고 마무리하겠습니다. 생일축하합니다 정아선배 🎉🎉🎉🎉🎉🎉🎂🎂🎂🎉🎉🎉🎉🎊🎊", phoneNum: "01082448191"),
            LetterData(writtenBy: "예원", letter: "안녕 정아야~~ 내 생일이었던게 엊그제같은데(?) 벌써 너의 생일이라니.. 시간이 참 빠르다는 생각을 해. 우선! 생일 정말 정말 축하해  ! !! ! !>< 아마 열두시에 이 어플을 받게 될꺼니까 축하 15번째 안으로는 들어오겠지? ㅎㅋ 사실 롤페를 쓴 지 얼마 안되어서 어떤 이야기를 할까 고민했어. 그냥 이런 저런 이야기를 써보자면?! 나는 이번 동아리가 우리 학교 사람들 외의 사람들을 만나는 첫번째  기회였거든 그래서 이래저래 참 고민이 많았어. 나는 보통 첫인상이랑 다르다는 이야기를 좀 들어서, 혹시 또 급하게 친해지려고 하다 부담스럽게 느끼진 않을지, 내가 하는 말들이 선을 넘지 않을지 그런거에 참  ㅠ 그럼 안되지만 고민을 많이하거든. 근데 전에 내가 리치 여인숙 ㅋㅋ 에서 막 몇 번 물어봤을 때 너가 완전 큘하게 괜찮았다고 해준게 난 아직도 참 고맙따 ?@?@ ㅎㅎ 오글 하지만 생일 편지니까 오글거려볼게 ㅎ 그래서 그 날 집가는 길에 되게 맘 편히 갔어. 그래서 그 이후에 너랑 더 친해지고 싶다는 생각을 했다네.  하지만 재학생이라는 벽이,, 가로막아서 아~ 나도 가고싶은데. 아~ 나도 참여하고 싶었는데 하고 얼마나 생각을 많이 했는지 ?! 큐큐 그래서 앱잼도 정말 같이 하고 싶었꼬,,, ㅋ 머지 이거 어필 편지인가? ㅋㅋ 나도 솝트에서 술 마실 때 너가 항상 잘 갈겨줘서 넘 좋앙 ㅎ 술 마시는 것도 좋고 카페가서 공부하는 것도 좋고,,,  하 왜케 너랑 하고싶은게 많은지? ㅋ 그런 스타일 알지,,, 가만 있어도 인기 끄는 스타일. 그게 바로 너..? 롤페에도 썼지만, 운팀 끝나도,, 앱잼 끝나면,, 자주 봤음 좋겠다 나의 첫번째... 다른 학교 친구들,,,,(?),,, 나 첫번째 이런거에 집착하는 스타일이거든 ㅎ 아무튼, 오늘 생일 정말 축하하고 많은 사람들에게 축하받고 맛있는 것도 많이 먹고 행복한 하루 보내기를 바랄게. 채소정아 채정아 ~  ~ ~ ~ ~ 생일 정말 정말 축하해 !!!!", phoneNum: "01088624229"),
            LetterData(writtenBy: "지윤", letter: "정아언닝~~~ 난 지윤이얌>< 언니 나랑 집 가깝다고 놀아준다고 해놓고 아직도 단한번도 안 논거 사실이냐구ㅠ 심지어 오늘도 언니 못만나써,,,흑흑 일단 언니 생일 너무너무 축하해~~~🥳🎉🎉 운팀 회의 처음 하면서 언니 처음 본 것도 얼마 안된 것 같은데 벌써 본지도 꽤 오래됐당,,,, 시간이 넘 빨라,,,, 사실 우리 친해진게 친해지길 바래 하면서 처음 제대로 놀아보구 그다음에 믿말단 하고 같은 방 쓰면서 같이 놀았던 것 같은데 넘무 재밌었엉>< 언니는 나랑 놀고싶을지 모르겠지만,,, 난 언니가 참 좋아^^ 나랑 놀아주라구~~~~~ 내가 부르면 나올건가???!! 암튼!! 생일인만큼 오늘은 좋은 사람들이랑 재밌게 보내!! 축하도 많이많이 받구!! 케이크도 세판은 먹어 알겠지!?!! 그럼 안뇽~~~~~", phoneNum: "01024225335"),
            LetterData(writtenBy: "송현", letter: "사정아야 생일 축하해♥ 운팀 면접에서 널 처음보고, 번개에서 술 마신게 엊그제 같은데... 벌써 정아 생일에, 앱잼이라니 시간이 너무 빠른거 같아....  정아 탄신 23주년을 기념해서 삼행시 써볼게\n\n채 : 채우고 싶어...\n정 : 정말 안되겠니...?\n아 : 아름다워 질거야... 채정아 너로 세상을 가득 채운다면 말이야", phoneNum: "01075083282"),
            LetterData(writtenBy: "세린", letter: "정아언니 안뇽 나 세린이야 :-)\n6월 22일 생일 축하해 !!! 솝트 면접 봤을 때부터 운팀 그리고 솝커톤까지 우리 진짜 많이 겹친거 알지. 이정도면 솝트에서도 손꼽게 destiny라고 생각해. 줌 할 때마다 언니한테 디엠 보내는게 그렇게 재밌었는데 … 솝커톤 릴리즈 회의하면 또 해야겠다 ^0^ 이제 종강했으니깐 내가 이제 용산 갈게 언니 보러ㅜ 나도 언니랑 갈기고 싶어 … 다음 기수 서버파트장 언니가 한다며? 갑자기 서버 OB 하고 싶기도 하고 그러네 암튼 언니 진짜 대단한 것 같어 앞으로도 더 대단하고 도약하길 응원할게 내가 또 한 치어리딩 하거든… 보고싶으면 내가 영상 찍어서 보내줄게 원하지 않으면 어쩔 수 없고 … 언니 생일 단톡방 내가 판거 알아? 그 누구보다 언니 생일 넘 기다리고 있었어 ㅎ 생색이냐고? 약간 맞는 것 같기도 하고 … 마무리는… 앱잼도 이제 팀빌딩할텐데 좋은 팀 원하는 팀에 꼭 들어가서 이번 여름도 재밌게 보냈음해 :3 내가 언니 많이 좋아하는거 알지? 모르면 이제 알아둬 … 생일 정말 정말 많이 축하해 언니 ❤️‍🔥", phoneNum: "01030927998"),
            LetterData(writtenBy: "민영", letter: "투 큐티정아\n정아언니 생일 너무 축하해 나 미뇽이야❤️ 우리 요새 좀 친해진거같지 않아..? 사실 저번 약수 내가 놀러갈을 때부터 우린 시작됏어. 나 사실 언니 되게 마니 좋아하거덩 맨날 스토리 답장도 하구(언니는 가끔 답장해주지만...) 우리 앞으로 할게 너무너무 많아 ! 예를 들면 광장시장, 방탈출갈기기 ,,, 언젠가는 내가 취할 때까지 술 마시기~~~ 저번에 가영이도 같이 만났을 때 좀 아쉬웠는데 담에 울집 초대하께 🥲❤️❤️ 그때 술조져... 앱잼 시작 직전에 생일이라니 충분히 즐기고 앱잼 3주 빡세게 화이팅하길 바라❤️‍🔥 미뇽과 오래오래 봐줘 고마워 사랑행 23살 생일 너무 축하핵!!!!!!!!!! 언제든지 나랑 카공하자아 오늘 하루 행복하게 보내!!!\n프롬 정뇽코인 밀고있는 미녕", phoneNum: "01047616185")
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
    

    @IBAction func touchUpToGalleryBtn(_ sender: UIButton) {
        //뷰 전환
        let galleryVC = (self.storyboard?.instantiateViewController(identifier: "GalleryVC"))! as GalleryVC
        self.navigationController?.pushViewController(galleryVC, animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        UserDefaults.standard.set(letterArray[indexPath.row].writtenBy, forKey: "selectedTimiName")
        UserDefaults.standard.set(letterArray[indexPath.row].phoneNum, forKey: "selectedTimiPhone")
        
        let replyVC = storyboard?.instantiateViewController(identifier: "ReplyVC") as! ReplyVC
        self.navigationController?.pushViewController(replyVC, animated: true)
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
