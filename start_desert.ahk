

시작서치()
{
	WinGet,processId,ID,%WindowName%
	Loop,3
	{
		if(Search_img("Image\검은사막이미지.bmp",processId,x,y,80)){
			leftClick(x,y,2)
			
			이용약관서치()	
			
			계정사용허용()
			sleep, 30000
			계정선택()

			서버선택()
			
			광고제거()
			
			시작드래그()
			
			startGPS()
			sleep,1000
		}
	}
}

StartSearch:	
	StartWhile()
return 

시작드래그(){
	WinGet,processId,ID,%WindowName%
	endCheck := false
	while(1){
		if(Search_img("Image\게임패드.bmp",processId,x,y,70)){
			DragClick(x,y)
			endCheck = true
		}
		if(endCheck){
			break 
		}
	}
}
광고제거(){
	WinGet,processId,ID,%WindowName%
	sleep, 14000
	if(Search_img("Image\이벤트광고.bmp",processId,x,y,80)){
		leftClick(x,y,1)
		sleep,1000
	}
	if(Search_img("Image\출석.bmp",processId,x,y,80)){
		leftClick(x,y,1)
		sleep,1000
	}
}
계정선택(){
	WinGet,processId,ID,%WindowName%
	
	loop,3
	{
		if(Search_img("Image\계정선택.bmp",processId,x,y,80)){
			leftClick(x,y,2)
			sleep,3000
		}
	}
}
이용약관서치(){
	WinGet,processId,ID,%WindowName%
	sleep, 9000
	loop,3
	{
		if(Search_img("Image\이용약관.bmp",processId,x,y,80)){
			leftClick(x,y,2)
			sleep,1500
		}
		if(Search_img("Image\이용약관동의.bmp",processId,x,y,80)){
			;~ MouseMove, x, y
			leftClick(x,y,1)
			sleep,700
			next = 2
		}
		if(Search_img("Image\이용약관확인.bmp",processId,x,y,70)){
			leftClick(x,y,2)
			break
		}
	}
}
return 
계정사용허용(){
	WinGet,processId,ID,%WindowName%
	sleep,7000
	loop,3
	{
		if(Search_img("Image\계정사용허용.bmp",processId,x,y,80)){
			leftClick(x,y,1)
			sleep,2500
		}
		if(Search_img("Image\구글계정선택.bmp",processId,x,y,80)){
			leftClick(x,y,1)
			sleep,1500
		}
	}
}

StartWhile(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\응답없음팅김.bmp",processId,x,y,80,응답없음팅김X1,응답없음팅김Y1,응답없음팅김X2,응답없음팅김Y2)){
		leftClick(응답없음확인X ,응답없음확인Y,2)
		sleep, 6000
		시작서치()
	}
	
}
return 


서버선택(){
	WinGet,processId,ID,%WindowName%
	next := 0
	;~ MsgBox, %x%, %y% ,%WindowName%
	Loop,3
	{
		if(next == 0){
			Loop,3
			{
				if(Search_img("Image\서버선택.bmp",processId,x,y,60)){
					leftClick(650,100,1)
					;~ leftClick(x,y,1)
					next = 3
				}
				sleep, 2000
			}
		}
		;~ if(next == 1){
			;~ sleep,1000
			;~ if(Search_img("Image\서버선택2.bmp",processId,x,y,90)){
				;~ leftClick(x,y,1)
				;~ next = 2
			;~ }
		;~ }
		;~ if(next == 2){
			;~ sleep,1000
			;~ ServerSelect()
			;~ next =3
		;~ }
		if(next ==3){
			sleep,10000
			;~ 서버이름
			if(Search_img("Image\캐릭터선택.bmp",processId,x,y,70)){
				leftClick(x,y,3)
				next = 4
				break
			}
		}
	}
}
return 
ServerSelect(){
	WinGet,processId,ID,%WindowName%
	if(Server == "하이델"){
		if(Search_img("Image\하이델.bmp",processId,x,y,80)){
			leftClick(x,y,2)
		}
	}else if(Server == "칼페온"){
		if(Search_img("Image\칼페온.bmp",processId,x,y,80)){
			leftClick(x,y,2)
		}
	}
}
