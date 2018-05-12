;~ global RepeatStartCnt := 1
global RepeatEndCnt := 1
global GetItemCnt := 1
global WeightCnt := 1
global petCnt := 1
global blackPixieCnt := 1
global blackPixieYn := "Y"

repeatAll(){
	;~ Weight()
	
	;~ if(RepeatStartCnt >= 36){
		;~ RepeatStart()
		;~ RepeatStartCnt = 0
	;~ }else{
		;~ RepeatStartCnt++
	;~ }
	
	if(RepeatEndCnt >= 3){
		RepeatEnd()
		RepeatEndCnt = 0
	}else{
		RepeatEndCnt++
	}	
	
	if(WeightCnt >= 10){
		Weight()
		WeightCnt = 0 
	}else{
		WeightCnt++
	}
	
	;~ if(GetItemCnt >= 2){
		;~ GetItem()
		;~ GetItemCnt = 0
	;~ }else{
		;~ GetItemCnt++
	;~ }
	
	if(petCnt >= 400){
		pet()
		petCnt = 0
	}else{
		petCnt++
	}
	
	if(blackPixieYn == "Y"){		
		if(blackPixieCnt >= 50 ){
			blackPixieRequest()
			blackPixieCnt = 0
		}else{
			blackPixieCnt++
		}
	}
}
자동사냥시작(){
	WinGet,processId,ID,%WindowName%
	;~ eat()
	;~ go사냥터()
	Weight()
	;~ petEatClick()
	;~ Weight()
	;~ skill_up()
	blackPixieYn := "Y"
	blackPixieRequest()
	;~ RepeatStart()
	RepeatEnd()
	
	while(%repeat매크로시작% == true){
		repeatAll() 
		sleep, 3700
	}
}
말가방에넣기(){
	sleep,1500
		
	;~ 말가방 넣기 클릭
	leftClick(815,680,1)
	
	;~ 맥스클릭
	sleep,1500
	leftClick(745,558,1)
	
	;~ 말가방 넣기 확인 클릭
	sleep,1500
	leftClick(740,650,1)
	
	sleep,1500
	leftClick(1230,70,1)
}

;~ 전리품 찾기
trophySearch(trophy){
	WinGet,processId,ID,%WindowName%
	
	URI1 := % "Image\repeat\" trophy "1.bmp" 
	URI2 := % "Image\repeat\" trophy "2.bmp" 
	URI3 := % "Image\repeat\" trophy "3.bmp" 
	;~ MsgBox, % search_img_GPS(URI1,processId,x,y,100,말아이템창X1,말아이템창Y1,말아이템창X2,말아이템창Y2)
	if(search_img_GPS(URI1,processId,x,y,100,말아이템창X1,말아이템창Y1,말아이템창X2,말아이템창Y2)){
		;~ MsgBox, %URI1% , %x%, %y%
		leftClick(x,y+20,1)
	}else if(search_img_GPS(URI2,processId,x,y,100,말아이템창X1,말아이템창Y1,말아이템창X2,말아이템창Y2)){
		;~ MsgBox, %URI2% , %x%, %y%
		leftClick(x,y+20,1)
	}else if(search_img_GPS(URI3,processId,x,y,100,말아이템창X1,말아이템창Y1,말아이템창X2,말아이템창Y2)){
		;~ MsgBox, %URI3% , %x%, %y%
		leftClick(x,y+20,1)
	}else {
		return "N"
	}
	return "Y"
	;~ sleep,5000
}

Weight(){
	WinGet,processId,ID,%WindowName%

	;~ 전리품목록을 선택하지 했을 무게정리
	if(repPoint != ""){
		if(search_img_GPS("Image\repeat\무게최대초과.bmp",processId,x,y,70,무게X1,무게Y1,무게X2,무게Y2)){
			Weight_execute()
		}
	}
}
Weight_execute(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\repeat\무게최대초과.bmp",processId,x,y,90,무게X1,무게Y1,무게X2,무게Y2)){
		leftClick(x,y,1)
		sleep,1500
	
		if(search_img_GPS("Image\무게_마을이동.bmp",processId,x,y,100,무게마을이동X1,무게마을이동Y1,무게마을이동X2,무게마을이동Y2)){
			leftClick(x,y,1)
			sleep,46000
		}else if(search_img_GPS("Image\repeat\무게_마을이동.bmp",processId,x,y,100,무게마을이동X1,무게마을이동Y1,무게마을이동X2,무게마을이동Y2)){
			leftClick(x,y,1)
			sleep,46000
		}else{
			leftClick(640,120,1)
		}
		if(search_img_GPS("Image\상점.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
			leftClick(x,y,1)
			sleep,1300
		}else if(search_img_GPS("Image\상점2.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
			leftClick(x,y,1)
			sleep,1300
		}else if(search_img_GPS("Image\상점3.bmp",processId,x,y,100,상점_2X1,상점_2Y1,상점_2X2,상점_2Y2)){
			leftClick(x,y,1)
			sleep,1300
		}	
		if(search_img_GPS("Image\전리품정리.bmp",processId,x,y,100,전리품정리X1,전리품정리Y1,전리품정리X2,전리품정리Y2)){
			leftClick(x,y,1)
			sleep,1000
			leftClick(1220,70,1)
			sleep,1500
			go사냥터()
			sleep,500
			Item_Leave()
			sleep,2000
			skill_up()
			sleep,1500
			crystalCompose()
		}
	}
	return
}
go사냥터(){
	WinGet,processId,ID,%WindowName%
	
	;~ if(search_img_GPS("Image\repeat\마을가기마크.bmp",processId,x,y,50,특수메뉴X1,특수메뉴Y1,특수메뉴X2,특수메뉴Y2)){
	leftClick(330,70,1)
	sleep, 1500
	if(search_img_GPS("Image\크자카\크자카 출정.bmp",processId,x,y,70,크자카출정X1,크자카출정Y1,크자카출정X2,크자카출정Y2)){
		leftClick(x,y,1)
		sleep,10000
		leftClick(330,70,1)
	}
	;~ 사냥터로 이동하는 버튼이 보이지 않으면 무한루프를 하면서 찾는다. 찾는 도중엔 기본사냥터로 이동해서 사냥한다.
	while(1){
		if(search_img_GPS("Image\repeat\사냥터이동.bmp",processId,x,y,70,사냥터이동X1,사냥터이동Y1,사냥터이동X2,사냥터이동Y2)){
			leftClick(x,y,1)
			sleep, % 1000*150
			;~ 자동사냥 클릭
			leftClick(420,680,1)
			sleep,1000
			break
		}else{
			leftClick(1190,260,1)
			sleep, 1000
			leftClick(1190,260,1)
			sleep,500
			leftClick(1190,260,1)
			sleep,60000
		}
	}
	;~ }
}
horseCall(){
	WinGet,processId,ID,%WindowName%
	
	sleep,1000
	;~ 말 클릭
	leftClick(45,380,1)
	sleep,6000
	
	;~ 말가방 클릭
	if(search_img_GPS("Image\repeat\말가방.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\repeat\말가방2.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\repeat\말가방3.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\repeat\말가방4.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
	}else{
		;~ MsgBox, end
		return "N"
	}
	
	;~ 말가방 열기 클릭
	sleep, 1500
	leftClick(1100,700,1)
	sleep,1000
	return "Y"
	
}
characterChange(characterNumber){
	WinGet,processId,ID,%WindowName%
	
	;~ 메뉴클릭
	sleep,3000
	leftClick(1230,70,1)
	
	;~ 설정클릭
	sleep,1500
	leftClick(1170,585,1)
	
	;~ 캐릭터변경 클릭
	sleep,2000
	leftClick(800,660,1)
	
	;~ 캐릭터 2번째 것 선택	(선택지 늘리기.)
	sleep,9000
	if(characterNumber == 1){
		leftClick(1220,85,6)
	}else if(characterNumber == 2){
		leftClick(1220,200,6)
	}
	
	;~ 광고종료
	sleep,15000
	if(search_img_GPS("Image\repeat\광고종료.bmp",processId,x,y,80,광고종료X1,광고종료Y1,광고종료X2,광고종료Y2)){
		leftClick(x,y,1)
		sleep,1500
	}
	
	;~ 출석종료
	if(search_img_GPS("Image\repeat\출석종료1.bmp",processId,x,y,80,출석종료X1,출석종료Y1,출석종료X2,출석종료Y2)){
		leftClick(x,y,1)
		sleep,1500
	}else if(search_img_GPS("Image\repeat\출석종료2.bmp",processId,x,y,80,출석종료X1,출석종료Y1,출석종료X2,출석종료Y2)){
		leftClick(x,y,1)
		sleep,1500
	}

	;~ 출석 종료할때 메세지 뜨면 종료
	if(search_img_GPS("Image\repeat\출석체크미룸확인.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
		sleep,2000
	}else if(search_img_GPS("Image\repeat\수령미룸확인.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
		sleep,2000
	}
	sleep,2000
}
;~ 수정합성
crystalCompose(){
	WinGet,processId,ID,%WindowName%
	
	;~ 흑정령클릭
	leftClick(830,710,1)
	
	;~ 수정합성클릭
	sleep, 1500
	leftClick(1180,330,1)
	
	;~ 자동합성클릭
	sleep, 1500
	leftClick(960,700,1)
	
	;~ 확인클릭
	sleep, 1500
	leftClick(730,570,1)
	
	;~ 자동합성중지
	sleep,12000
	leftClick(475,680,1)
	
	;~ 나가기
	sleep,2000
	leftClick(1230,70,1)
	sleep,1500
}

;~ 스킬 업
skill_up(){
	leftClick(1030,70,1)
	sleep, 2000
	
	cnt := 0
	loop,5
	{
		Y좌표 := 270
		loop,3
		{
			leftClick(1140,Y좌표,1)
			sleep,400
			leftClick(830,570,1)
			sleep,400
			leftClick(660,540,1)
			sleep,800
			Y좌표 = % Y좌표 + 110
		}
		MouseDragClick(1140,540,1140,210)
		cnt++
	}
	sleep, 500
	leftClick(1230,70,1)
	;~ 1140,640
	;~ leftClick(1140,380,1)
	;~ sleep,1000
}
Item_Leave(){
	WinGet,processId,ID,%WindowName%
	if(PixieEatLimit != ""){
		;~ sleep,50
		leftClick(830,710,1)

		leftClick(1140,240,1)
		leftClick(x,y,1)
		sleep,1000
		leftClick(1050,200,1)
		sleep,500
		eat()
		sleep,1500
	}
}
eat(){
	WinGet,processId,ID,%WindowName%
	cnt := 0
	LimitIndex := 1
	
	;~ 흑정령 장비 제물 제한
	if(PixieEatLimit == "회색"){
		LimitIndex = 1
	}else if(PixieEatLimit == "하얀색"){
		LimitIndex = 2
	}else if(PixieEatLimit == "초록색"){
		LimitIndex = 3
	}else if(PixieEatLimit == "파란색"){
		LimitIndex = 4
	}else if(PixieEatLimit == "보라색"){
		LimitIndex = 5
	}else if(PixieEatLimit == "노란색"){
		LimitIndex = 6
	}
	
	;~ MsgBox, %LimitIndex%
	while(1){
		if(search_img_GPS("Image\흑정령먹이_normal.bmp",processId,x,y,40,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(search_img_GPS("Image\흑정령먹이_magic.bmp",processId,x,y,40,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(search_img_GPS("Image\흑정령먹이_blue.bmp",processId,x,y,40,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 4 && search_img_GPS("Image\item_eat\itemblue_1.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 4 && search_img_GPS("Image\item_eat\itemblue_2.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 3 && search_img_GPS("Image\item_eat\itemgreen_5.bmp",processId,x,y,55,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_1.bmp",processId,x,y,55,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_3.bmp",processId,x,y,55,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_5.bmp",processId,x,y,55,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_1.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_3.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_5.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else{
			eat_sub()
			leftClick(1230,70,1)
			break
		}
		
		if(cnt >9){
			eat_sub()
			
			cnt = 0
		}
	}
}
eat_sub(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\흑정령기운흡수.bmp",processId,x,y,70,기운흡수X1,기운흡수Y1,기운흡수X2,기운흡수Y2)){
		leftClick(x,y,1)
		sleep,500
	}
	if(search_img_GPS("Image\흑정령흡수_확인.bmp",processId,x,y,70,흡수확인X1,흡수확인Y1,흡수확인X2,흡수확인Y2)){
		leftClick(x,y,1)
		sleep,1000
	}
}
Weight_end(){
	sleep,1000
	;~ RepeatStart()
	RepeatEnd()
}
GetItem(){
	WinGet,processId,ID,%WindowName%
	
	if(search_img_GPS("Image\아이템생자_GIB.bmp",processId,x,y,150,아이템상자X1,아이템상자Y1,아이템상자X2,아이템상자Y2)){
		leftClick(x,y,2)
		sleep,500
	}else if(search_img_GPS("Image\아이템생자_small.bmp",processId,x,y,150,아이템상자X1,아이템상자Y1,아이템상자X2,아이템상자Y2)){
		leftClick(x,y,2)
		sleep,500
	}else if(search_img_GPS("Image\아이템생자_small2.bmp",processId,x,y,150,아이템상자X1,아이템상자Y1,아이템상자X2,아이템상자Y2)){
		leftClick(x,y,2)
		sleep,500
	}
}
RepeatStart(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\반복퀘스트.bmp",processId,x,y,90,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
		;~ MsgBox, 2
		leftClick(x,y,1)
		sleep,500
		leftClick(x-50,y,2)
		sleep,6000
	}
	;~ else if(search_img_GPS("Image\반복퀘스트3.bmp",processId,x,y,90,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
		;~ MsgBox, 2
		;~ leftClick(x,y,1)
		;~ sleep,500
		;~ leftClick(x-50,y,2)
		;~ sleep,6000
	;~ }else if(search_img_GPS("Image\반복퀘스트2.bmp",processId,x,y,90,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
		;~ MsgBox, 2
		;~ leftClick(x,y,1)
		;~ sleep,500
		;~ leftClick(x-50,y,2)
		;~ sleep,6000
	;~ }
}

RepeatEnd(){
	WinGet,processId,ID,%WindowName%
	
	if(search_img_GPS("Image\반복완료1.bmp",processId,x,y,100,완료X1,완료Y1,완료X2,완료Y2)){
		;~ MsgBox, a5
		RepeatEnd_sub(x,y)
	}else if(search_img_GPS("Image\반복완료2.bmp",processId,x,y,100,완료X1,완료Y1,완료X2,완료Y2)){
		;~ MsgBox, a4
		RepeatEnd_sub(x,y)
	}else if(search_img_GPS("Image\반복완료3.bmp",processId,x,y,100,완료X1,완료Y1,완료X2,완료Y2)){
		;~ MsgBox, a3
		RepeatEnd_sub(x,y)
	}else if(search_img_GPS("Image\반복완료4.bmp",processId,x,y,100,완료X1,완료Y1,완료X2,완료Y2)){
		;~ MsgBox, as2
		RepeatEnd_sub(x,y)
	}else if(search_img_GPS("Image\반복완료5.bmp",processId,x,y,100,완료X1,완료Y1,완료X2,완료Y2)){
		;~ MsgBox, a1
		RepeatEnd_sub(x,y)
	}
	;~ else{
		;~ MouseDragClick_Timer(160,560,205,470,100)
		;~ sleep,200
	;~ }
	loop,2
	{
		if(search_img("Image\반복다시받기.bmp",processId,x,y,60)){
			leftClick(x,y,1)
			sleep,500
			next = 2
			break
		}
	}
	if(search_img("Image\반복수락.bmp",processId,x,y,60)){
		leftClick(x,y,1)
		sleep,1000
		leftClick(x,y,1)
		sleep,1500
		;~ RepeatStart()
	}
}
RepeatEnd_sub(x,y){
	leftClick(x,y,1)
	sleep,500
	leftClick(x-25,y,1)
	quest_next(x-25,y,8)
}
quest_next(x,y,i){
	Loop, %i%
	{
		sleep,400
		leftClick(x,y,1)
	}
}
petEatClick(){
	leftClick(620,523,1)
	sleep, 1500
	;~ msgbox, %petEat%
	if(petEat == "기본"){
		leftClick(430,611,1)
	}else if(petEat == "영양식"){
		leftClick(560,611,1)
	}
	sleep,1500
	
	return petEatCheck()
	
}
;~ 펫먹이가 있는지 체크
petEatCheck(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\repeat\펫먹이알림1.bmp",processId,x,y,90,펫먹이알림X1,펫먹이알림Y1,펫먹이알림X2,펫먹이알림Y2)){
		return "N"
	}else if(search_img_GPS("Image\repeat\펫먹이알림2.bmp",processId,x,y,90,펫먹이알림X1,펫먹이알림Y1,펫먹이알림X2,펫먹이알림Y2)){
		return "N"
	}
	return "Y"
}
pet(){
	if(petEat != ""){
		eatCheck := "Y" 
		;~ 첫번쨰 펫 먹이 먹이기
		leftClick(110,380,1)
		sleep, 1500
		eatCheck := petEatClick()
		
		if(eatCheck == "Y"){
			;~ 두번쨰 펫 먹이 먹이기
			leftClick(900,380,1)
			sleep, 1500
			eatCheck := petEatClick()
		}
		if(eatCheck == "Y"){
			;~ 세번쨰 펫 먹이 먹이기
			leftClick(900,500,1)
			sleep, 1500
			eatCheck := petEatClick()
		}
		;~ 먹이가 없으면 반려동물 창을 닫고 캐릭터 선택으로 먹이를 사러 가야함.
		if(eatCheck == "N"){
			leftClick(1230,70,1)
			petEatFurchase()
		}else{
			;~ 펫 먹이 정상종료
			leftClick(1230,70,1)
		}
	}
}
;~ 펫먹이 구입
petEatFurchase(){
	WinGet,processId,ID,%WindowName%
	
	checkYn := "N"
	
	sleep,1500
	if(search_img_GPS("Image\repeat\마을가기마크.bmp",processId,x,y,70,특수메뉴X1,특수메뉴Y1,특수메뉴X2,특수메뉴Y2)){
		leftClick(x,y,1)
		sleep,1000
		if(search_img_GPS("Image\repeat\가까운마을이동.bmp",processId,x,y,50,가까운마을이동X1,가까운마을이동Y1,가까운마을이동X2,가까운마을이동Y2)){
			leftClick(x,y,1)
			checkYn := "Y"
		}else{
			leftClick(24,605,1)	;탐색 실패시 창닫기위한 다른곳 클릭(마우스 패드쪽)
			checkYn := "N"
		}
		
	}
	if(checkYn == "Y"){
		sleep,9000
		
		leftClick(230,240,1)		;상인목록 탭
		sleep,1000
		leftClick(270,210,1)		;상인목록 펼치기
		sleep,1000
		;~ 펫상인에게 이동
		if(search_img_GPS("Image\repeat\펫상인마크.bmp",processId,x,y,80,상인리스트X1,상인리스트Y1,상인리스트X2,상인리스트Y2)){
			leftClick(x,y,1)
		}else{
			leftClick(320,165,1)
		}
		;~ 상인목록축소
		sleep,2000
		leftClick(550,360,1)
		
		;~ 이동대기
		sleep,25000
		petBrokeCheckYn := "N"
		loop, 3
		{
			;~ 펫상인클릭
			if(search_img_GPS("Image\repeat\펫상인.bmp",processId,x,y,75,행동X1,행동Y1,행동X2,행동Y2)){
				leftClick(x,y,1)
				petBrokeCheckYn := "Y"
				break
			}else if(search_img_GPS("Image\repeat\펫상인2.bmp",processId,x,y,20,상점_2X1,상점_2Y1,상점_2X2,상점_2Y2)){
				leftClick(x,y,1)
				petBrokeCheckYn := "Y"
				break
			}else{
				MouseDragClick(560,630,800,645)
				petBrokeCheckYn := "N"
			}
			sleep,1000
		}
		if(petBrokeCheckYn == "N"){
			go사냥터()	;~ 펫상인을 못찾으면 사냥터로
			return ;펫먹이 구매 종료
		}
		;~ 사료클릭
		sleep, 2000
		leftClick(100,270,1)
		;~ 사료 +100개,+50개클릭 후 확인, 구매 클릭, 창종료
		sleep, 1200
		leftClick(750,500,1)
		sleep, 1000
		leftClick(750,420,1)
		sleep, 1000
		leftClick(750,620,1)
		sleep, 1500
		leftClick(750,620,1)
		sleep,1500
		leftClick(1230,70,1)
			
		;~ 사냥터로 가서 사냥 
		sleep, 1500
		go사냥터()
	}
}
;~ 캐릭 변경 후 사냥돌입 함수
crtChangeRepeat(){
	characterNumber := 1
	characterChange(characterNumber)
	
	;~ 자동사냥
	leftClick(440,700,1)
}
blackPixieRequest(){
	WinGet,processId,ID,%WindowName%

	sleep,2000
	
	;~ 흑정령 클릭
	leftClick(830,700,1)
	sleep,1500
	
	;~ 흑정령의뢰 들어가기
	leftClick(1190,640,1)
	sleep, 1000
	
	;~ 흑정령 의뢰창인지 확인
	if(search_img_GPS("Image\흑정령의뢰_아이템.bmp",processId,x,y,90,흑정령의뢰_아이템X1,흑정령의뢰_아이템Y1,흑정령의뢰_아이템X2,흑정령의뢰_아이템Y2)){
		sleep,500
		if(search_img_GPS("Image\흑정령수락.bmp",processId,x,y,50,흑정령퀘스트X1,흑정령퀘스트Y1,흑정령퀘스트X2,흑정령퀘스트Y2)){
			leftClick(x,y,1)
			sleep,1000
			;~ 수락버튼 클릭
			loop,8
			{
				leftClick(710,610,1)
				sleep,1500
			}
		}else{
			if(search_img_GPS("Image\흑정령수락불가.bmp",processId,x,y,70,흑정령퀘스트X1,흑정령퀘스트Y1,흑정령퀘스트X2,흑정령퀘스트Y2)){
				;~ 의뢰 수행중이면 창 종료
			}else{
				;~ 수락할 퀘스트가 없으면 다음부터 보지않음
				blackPixieYn := "N"
			}
		}
		;~ 흑정령 의뢰창 종료
		leftClick(1230,70,1)
		;~ msgbox, %blackPixieYn%
	}
	return
}
