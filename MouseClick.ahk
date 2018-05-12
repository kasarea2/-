
;~ ---------------------------------------------------------------------------------------------마우스
; 비활성 마우스 클릭 함수
leftClick(cX, cY,clickcnt) {
	;~ coordMode, mouse, Window
	
	innerX := cX 
	innerY := cY
	;~ MsgBox, %innerX% , %innerY% ,%cX% , %cY%, %w_x%
	Loop, %clickcnt%
	{
		;~ MsgBox, %cX%, %cY%
		;~ mousemove,cX,cY
		SetControlDelay -1
		controlClick , x%innerX% y%innerY%,%WindowName%
		
		sleep, 100
		;~ MsgBox, %errorlevel%
	}
}

; 비활성 마우스 클릭 함수
leftingClick(cX, cY) {
	
	innerX := cX 
	innerY := cY - 35
	
	lparam := innerX | innerY << 16
	PostMessage, 0x201, 1, %lparam%, RenderWindow1, %WindowName%

	Sleep, 1000
	
}

; 비활성 마우스 드래그 함수 (낚시용?)
DragClick(cX, cY) {
	;~ coordMode, mouse, %WindowName%
	innerX := cX 
	innerY := cY
	
	temp := 10
	
	cnt := 1
	
	SetControlDelay -1
	while(cnt < 11){
		;~ MsgBox,%innerY%
		controlClick , x%innerX% y%innerY%, %WindowName%,,left,1,D NA
		sleep,100
		;~ innerX = cX + cnt*5
		innerX = % cX + cnt*12
		cnt++
	}
	sleep, 10000
	controlClick , x%innerX% y%innerY%, %WindowName%,,left,1,U NA
}
MouseDragClick(x1,y1,x2,y2){
	;~ coordMode, mouse, %WindowName%
	
	innerX1 := x1 
	innerY1 := y1 
	innerX2 := x2 
	innerY2 := y2 
	tempX := % innerX1
	tempY := % innerY1
	
	드래그반복X := true
	드래그반복Y := true
	SetControlDelay -1
	controlClick , x%innerX1% y%innerY1%,%WindowName%,,left,1,D NA
	while(드래그반복X or 드래그반복Y){
		if(innerX1 < innerX2){
			if(tempX >= innerX2){
				;~ MsgBox,1
				드래그반복X = % false
			}else{
				;~ MsgBox,2
				tempX = % tempX + 10
			}
		}else{
			if(tempX <= innerX2){
				;~ MsgBox,6
				드래그반복X = % false
			}else{
				;~ MsgBox,3
				tempX = % tempX - 10
			}
		}
		if(innerY1 < innerY2){
			if(tempY >= innerY2){
				;~ MsgBox,7
				드래그반복Y = % false
			}else{
				;~ MsgBox,4
				tempY = % tempY + 10
			}
		}else{
			if(tempY <= innerY2){
				;~ MsgBox,8
				드래그반복Y = % false
				;~ MsgBox, 끗
			}else{
				;~ MsgBox,5
				tempY = % tempY - 10
			}
		}
		controlClick , x%tempX% y%tempY%,%WindowName%,,left,1,D NA
		sleep,50
	}
	SetControlDelay -1
	controlClick , x%tempX% y%tempY%,%WindowName%,,left,1,U NA
}
MouseDragClick_Timer(x1,y1,x2,y2,timer){
	;~ coordMode, mouse, %WindowName%
	
	innerX1 := x1 
	innerY1 := y1 
	innerX2 := x2
	innerY2 := y2 
	
	tempX := % innerX1
	tempY := % innerY1
	
	드래그반복X := true
	드래그반복Y := true
	SetControlDelay -1
	controlClick , x%innerX1% y%innerY1%,%WindowName%,,left,1,D NA
	while(드래그반복X or 드래그반복Y){
		if(innerX1 < innerX2){
			if(tempX >= innerX2){
				;~ MsgBox,1
				드래그반복X = % false
			}else{
				;~ MsgBox,2
				tempX = % tempX + 10
			}
		}else{
			if(tempX <= innerX2){
				;~ MsgBox,6
				드래그반복X = % false
			}else{
				;~ MsgBox,3
				tempX = % tempX - 10
			}
		}
		if(innerY1 < innerY2){
			if(tempY >= innerY2){
				;~ MsgBox,7
				드래그반복Y = % false
			}else{
				;~ MsgBox,4
				tempY = % tempY + 10
			}
		}else{
			if(tempY <= innerY2){
				;~ MsgBox,8
				드래그반복Y = % false
				;~ MsgBox, 끗
			}else{
				;~ MsgBox,5
				tempY = % tempY - 10
			}
		}
		controlClick , x%tempX% y%tempY%,%WindowName%,,left,1,D NA
		sleep,10
	}
	sleep, %timer%
	SetControlDelay -1
	controlClick , x%tempX% y%tempY%,%WindowName%,,left,1,U NA
}