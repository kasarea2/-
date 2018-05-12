global RepeatStartCnt := 1
global RepeatEndCnt := 1
global GetItemCnt := 1
global WeightCnt := 1
global petCnt := 1
global blackPixieCnt := 1
global blackPixieYn := "Y"

repeatAll(){
	;~ Weight()
	
	if(RepeatStartCnt >= 36){
		RepeatStart()
		RepeatStartCnt = 0
	}else{
		RepeatStartCnt++
	}
	
	if(RepeatEndCnt >= 3){
		RepeatEnd()
		RepeatEndCnt = 0
	}else{
		RepeatEndCnt++
	}	
	
	if(WeightCnt >= 20){
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
	;~ skill_up()
	blackPixieYn := "N"
	blackPixieRequest()
	RepeatStart()
	RepeatEnd()
	Weight()
	
	while(%repeat매크로시작% == true){
		repeatAll() 
		sleep, 3700
	}
}
Weight(){
	WinGet,processId,ID,%WindowName%
	end := false
	if(search_img_GPS("Image\무게초과.bmp",processId,x,y,100,무게X1,무게Y1,무게X2,무게Y2)){
		leftClick(x,y,1)
		sleep,1500
	}
	if(search_img_GPS("Image\무게_마을이동.bmp",processId,x,y,100,무게마을이동X1,무게마을이동Y1,무게마을이동X2,무게마을이동Y2)){
		leftClick(x,y,1)
		sleep,46000
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
		sleep,1000
		end = true
		Item_Leave()
		sleep,2000
		skill_up()
	}
	;~ if(end){
		;~ Weight()
	;~ }
	weight_end()
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
			sleep,700
			leftClick(830,570,1)
			sleep,700
			leftClick(660,540,1)
			sleep,1000
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
		if(search_img_GPS("Image\흑정령먹이_normal.bmp",processId,x,y,90,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(search_img_GPS("Image\흑정령먹이_magic.bmp",processId,x,y,90,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(search_img_GPS("Image\흑정령먹이_blue.bmp",processId,x,y,90,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 4 && search_img_GPS("Image\item_eat\itemblue_1.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 4 && search_img_GPS("Image\item_eat\itemblue_2.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 3 && search_img_GPS("Image\item_eat\itemgreen_5.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_1.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_3.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_5.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_1.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_3.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_5.bmp",processId,x,y,30,흑정령아이템창X1,흑정령아이템창Y1,흑정령아이템창X2,흑정령아이템창Y2)){
			leftClick(x,y,1)
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
	RepeatStart()
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
		RepeatStart()
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
pet(){
	sleep,2000
	;~ 첫번쨰 펫 먹이 먹이기
	leftClick(110,380,1)
	sleep, 2500
	leftClick(620,523,1)
	sleep, 1500
	leftClick(560,665,1)
	sleep, 1500
	
	;~ 두번쨰 펫 먹이 먹이기
	leftClick(900,380,1)
	sleep, 1500
	leftClick(620,523,1)
	sleep, 1500
	leftClick(560,665,1)
	sleep, 1500
	
	;~ 세번쨰 펫 먹이 먹이기
	leftClick(900,500,1)
	sleep, 1500
	leftClick(620,523,1)
	sleep, 1500
	leftClick(560,665,1)
	sleep, 1500
	
	;~ 펫 먹이 끝
	leftClick(1230,70,1)
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
