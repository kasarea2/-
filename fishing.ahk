global fishingCheck := true

낚시(){
	fishingStart()
}
fishingStart(){
	WinGet,processId,ID,%WindowName%
	;~ DragClick(160,560)
	;~ 낚시위치찾기()
	while(%fishing매크로시작% == true){
		;~ MsgBox, 1
		if(search_img_GPS("Image\fishing\낚시대1.bmp",processId,x,y,120,낚시대X1,낚시대Y1,낚시대X2,낚시대Y2)){
			;~ MsgBox, 2
			fishingClick(x,y)
		}else if(search_img_GPS("Image\fishing\낚시대2.bmp",processId,x,y,120,낚시대X1,낚시대Y1,낚시대X2,낚시대Y2)){
			;~ MsgBox, 3
			fishingClick(x,y)
		}else if(search_img_GPS("Image\fishing\낚시대3.bmp",processId,x,y,120,낚시대X1,낚시대Y1,낚시대X2,낚시대Y2)){
			;~ MsgBox, 4
			fishingClick(x,y)
		}else if(search_img_GPS("Image\fishing\낚시대4.bmp",processId,x,y,120,낚시대X1,낚시대Y1,낚시대X2,낚시대Y2)){
			;~ MsgBox, 5
			fishingClick(x,y)
		}else if(search_img_GPS("Image\fishing\낚시대5.bmp",processId,x,y,120,낚시대X1,낚시대Y1,낚시대X2,낚시대Y2)){
			;~ MsgBox, 6
			fishingClick(x,y)
		}
		;~ MsgBox, 7
		tutorial_fishing()
		if(Search_img("Image\fishing\무게초과.bmp",processId,x,y,80)){
			leftClick(x,y,1)
			무게초과()
		}else if(Search_img("Image\fishing\무게초과2.bmp",processId,x,y,80)){
			leftClick(x,y,1)
			무게초과()
		}
		if(%fishingCheck% == true){
			낚시위치찾기()
		}
		fishingCheck = true
		sleep,4000
	}
}
낚시위치찾기(){
	WinGet,processId,ID,%WindowName%
	
	leftClick(상인목록버튼X,상인목록버튼Y,1)
	sleep,700
	;~ if(Search_img("Image\fishing\상인펼치기1.bmp",processId,x,y,85)){
	leftClick(상인목록펼치기X,상인목록펼치기Y,1)
	sleep,700
	;~ }else if(Search_img("Image\fishing\상인펼치기2.bmp",processId,x,y,85)){
		;~ leftClick(x,y,1)
	;~ }else if(Search_img("Image\fishing\상인펼치기3.bmp",processId,x,y,85)){
		;~ leftClick(x,y,1)
	;~ }
	
	if(search_img_GPS("Image\fishing\낚시상인1.bmp",processId,x,y,100,상인리스트X1,상인리스트Y1,상인리스트X2,상인리스트Y2)){
		leftClick(x,y,1)
		sleep,60000
	}else if(search_img_GPS("Image\fishing\낚시상인2.bmp",processId,x,y,110,상인리스트X1,상인리스트Y1,상인리스트X2,상인리스트Y2)){
		leftClick(x,y,1)
		sleep,60000
	}
	
	sleep,700
	;~ if(Search_img("Image\fishing\상인접기1.bmp",processId,x,y,85)){
	leftClick(상인목록접기X,상인목록접기Y,1)
	
	;~ }else if(Search_img("Image\fishing\상인접기2.bmp",processId,x,y,85)){
		;~ leftClick(x,y,1)
	;~ }
	sleep,1000
	DragClick(160,560)
} 
무게초과(){
	WinGet,processId,ID,%WindowName%
	sleep,60000
	if(search_img_GPS("Image\상점.bmp",processId,x,y,140,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
		sleep,500
	}else if(search_img_GPS("Image\상점2.bmp",processId,x,y,140,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
		sleep,500
	}
	if(search_img_GPS("Image\fishing\농어.bmp",processId,x,y,95,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	if(search_img_GPS("Image\fishing\갈치.bmp",processId,x,y,95,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	if(search_img_GPS("Image\fishing\고등어.bmp",processId,x,y,95,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	if(search_img_GPS("Image\fishing\망둥어.bmp",processId,x,y,95,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	if(search_img_GPS("Image\fishing\문어.bmp",processId,x,y,95,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	if(search_img_GPS("Image\fishing\벤자리.bmp",processId,x,y,95,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	if(search_img_GPS("Image\fishing\불가사리.bmp",processId,x,y,110,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	if(search_img_GPS("Image\fishing\삼치.bmp",processId,x,y,95,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	if(search_img_GPS("Image\fishing\전갱이.bmp",processId,x,y,95,팔기_아이템창X1,팔기_아이템창Y1,팔기_아이템창X2,팔기_아이템창Y2)){
		sale(x,y)
	}
	sleep,500
	leftClick(1230,70,1)
	sleep,1500
	낚시위치찾기()
	fishingCheck = false
}
sale(x,y){
	leftClick(x,y,1)
	sleep,1000
	leftClick(550,600,1)
	sleep,4500
}
fishingClick(x,y){
	WinGet,processId,ID,%WindowName%
	innerX := x
	innerY := y
	leftClick(innerX,innerY,1)
	sleep,15000
	Loop,8
	{
		if(search_img_GPS("Image\fishing\낚기1.bmp",processId,x,y,110,낚기머리위X1,낚기머리위Y1,낚기머리위X2,낚기머리위Y2)){
			break
		}else if(search_img_GPS("Image\fishing\낚기2.bmp",processId,x,y,110,낚기머리위X1,낚기머리위Y1,낚기머리위X2,낚기머리위Y2)){
			break
		}else if(search_img_GPS("Image\fishing\낚기3.bmp",processId,x,y,110,낚기머리위X1,낚기머리위Y1,낚기머리위X2,낚기머리위Y2)){
			break
		}else if(search_img_GPS("Image\fishing\낚기4.bmp",processId,x,y,110,낚기머리위X1,낚기머리위Y1,낚기머리위X2,낚기머리위Y2)){
			break
		}else if(search_img_GPS("Image\fishing\낚기5.bmp",processId,x,y,110,낚시대X1,낚시대Y1,낚시대X2,낚시대Y2)){
			break
		}else if(search_img_GPS("Image\fishing\낚기6.bmp",processId,x,y,110,낚기머리위X1,낚기머리위Y1,낚기머리위X2,낚기머리위Y2)){
			break
		}else if(search_img_GPS("Image\fishing\낚기7.bmp",processId,x,y,110,낚기머리위X1,낚기머리위Y1,낚기머리위X2,낚기머리위Y2)){
			break
		}
		sleep,2000
	}
	leftClick(innerX,innerY,1)
	sleep,850
	leftClick(innerX,innerY,1)
	
	fishingCheck = false
}

tutorial_fishing(){
	WinGet,processId,ID,%WindowName%
	;~ tutorialCheck := false
	;~ if(Search_img("Image\main_quest\튜토리얼1.bmp",processId,x,y,120,튜토리얼취소X1,튜토리얼취소Y1,튜토리얼취소X2,튜토리얼취소Y2)){
		;~ tutorialCheck = true
	;~ }else if(Search_img("Image\main_quest\튜토리얼2.bmp",processId,x,y,120,튜토리얼취소X1,튜토리얼취소Y1,튜토리얼취소X2,튜토리얼취소Y2)){
		;~ tutorialCheck = true
	;~ }
	
	;~ sleep,300
	;~ if(%tutorialCheck% == true){
		if(search_img_GPS("Image\main_quest\튜토리얼취소.bmp",processId,x,y,100,튜토리얼취소X1,튜토리얼취소Y1,튜토리얼취소X2,튜토리얼취소Y2)){
			;~ MsgBox,%x%, %y%
			leftClick(x,y,1)
		}
	;~ }
}