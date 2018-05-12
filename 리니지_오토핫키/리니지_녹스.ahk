/*
* 리니지 m 1.1v
*/
; 클래스 리스트
ClassList=기사|요정
IniRead OutputVar, %A_ScriptDir%\setting.ini, ClassName, name
StringReplace, ClassList, ClassList, %OutputVar%, %OutputVar%| 

; 사냥터 리스트
PlayList=시련의숲|죽음의폐허|남부필드|밀림지대|거울의숲|산적소굴|야만의숲지대|오크숲벌목지대|하이네늪지대|풍룡의상흔|샌드웜의안식처
IniRead OutputVar, %A_ScriptDir%\setting.ini, PlayName, name
StringReplace, PlayList, PlayList, %OutputVar%, %OutputVar%| 

Gui, Add, Text, x20 y20 w80 h20, 창이름 : 
Gui, Add, Edit, x100 y15 w60 h20 vWindowName

Gui, Add, Text, x20 y40 w80 h20, 클래스선택 : 
Gui, Add, DropDownList, x100 y35 w70 h60 vClassName, %ClassList%

Gui, Add, Text, x20 y60 w80 h20, 사냥터선택 :
Gui, Add, DropDownList, x100 y55 w300 h200 vPlayName, %PlayList%

Gui, Add, Text, x20 y80 w80 h20, 은화살
Gui, Add, Edit, x100 y75 w40 h20 vArrow

Gui, Add, Text, x20 y100 w80 h20, 체력회복제
Gui, Add, Edit, x100 y95 w40 h20 vPotion

Gui, Add, Text, x20 y120 w80 h20, 강촐
Gui, Add, Edit, x100 y115 w40 h20 vGreenPotion

Gui, Add, Text, x20 y140 w80 h20, 용기
Gui, Add, Edit, x100 y135 w40 h20 vPuplePotion

Gui, Add, Text, x150 y80 w80 h20, 마나회복물약
Gui, Add, Edit, x230 y75 w40 h20 vBluePotion

Gui, Add, Text, x150 y100 w80 h20, 변신주문서
Gui, Add, Edit, x230 y95 w40 h20 vTransformOrder

Gui, Add, Text, x150 y120 w80 h20, 귀환주문서
Gui, Add, Edit, x230 y115 w40 h20 vReturnOrder

Gui, Add, Text, x150 y140 w80 h20, 마법인형
Gui, Add, Edit, x230 y135 w40 h20 vDollOrder

Gui, Add, Text, x280 y80 w80 h20, 엘븐와퍼
Gui, Add, Edit, x360 y75 w40 h20 vElven

Gui, Add, Text, x280 y100 w80 h20, 그힐 간격
Gui, Add, Edit, x360 y95 w40 h20 vGreateHeal

Gui, Add, ListBox, x20 y160 w400 h100 vl_b

Gui, Add, Button, x60 y270 w110 h20, 시작
Gui, Add, Button, x180 y270 w110 h20, 중지
Gui, Add, Button, x300 y270 w110 h20, 종료
Gui, Show

;창이름 불러오기
IniRead OutputVar, %A_ScriptDir%\setting.ini, WindowName, name
GuiControl, , WindowName,  %OutputVar%

;화살 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, Arrow
GuiControl, , Arrow, %OutputVar%

;포션 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, Potion
GuiControl, , Potion, %OutputVar%

;강촐 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, GreenPotion
GuiControl, , GreenPotion, %OutputVar%

;용기 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, PuplePotion
GuiControl, , PuplePotion, %OutputVar%

;마나회복물약 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, BluePotion
GuiControl, , BluePotion, %OutputVar%

;변줌 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, TransformOrder
GuiControl, , TransformOrder, %OutputVar%

;귀환 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, ReturnOrder
GuiControl, , ReturnOrder, %OutputVar%

;마법인형 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, DollOrder
GuiControl, , DollOrder, %OutputVar%

;엘븐 개수 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, Elven
GuiControl, , Elven, %OutputVar%

;그힐 초 세팅
IniRead OutputVar, %A_ScriptDir%\setting.ini, Time, GreateHeal
GuiControl, , GreateHeal, %OutputVar%

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen


StartFlag := False

return

F11::
{
	mousegetpos,xp,yp
	printLog(xp . ", " . yp)
}
return


TIMER_GREATEHEAL:
	GreateHeal()
Return

; 그힐 시전
GreateHeal() {
	gui, submit, nohide
	WinGetPos, pos_x, pos_y, width, height, %WindowName%
	x_right := width + pos_x
	y_bottom := height + pos_y	
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\그힐.png
	if(ErrorLevel = 0) {
		;printLog("그힐")
		leftClick(FoundX, FoundY)
	}	
	Sleep, 2000
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\트리플.png
	if(ErrorLevel = 0) {
		;printLog("그힐")
		leftClick(FoundX, FoundY)
	}		
	
}

TIMER_MESSAGE:
	MessageCheck()
Return

; 메세지확인
MessageCheck() {
	gui, submit, nohide
	WinGetPos, pos_x, pos_y, width, height, %WindowName%
	x_right := width + pos_x
	y_bottom := height + pos_y	
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\메세지알림.png
	if(ErrorLevel = 0) {
		printLog("메세지알림")
		leftClick(FoundX, FoundY)
		Sleep, 2000
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\우편함.png
		if(ErrorLevel = 0) {
			printLog("우편함")		
			leftClick(FoundX, FoundY)
			Sleep, 2000
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\모두받기.png
			if(ErrorLevel = 0) {
				printLog("모두받기 ( " . FoundX . ", " . FoundY . ")")
				leftClick(FoundX, FoundY)
				Sleep, 3000			
			}
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\메세지함닫기.png
			if(ErrorLevel = 0) {
				printLog("닫기 ( " . FoundX . ", " . FoundY . ")")
				leftClick(FoundX, FoundY)
				Sleep, 3000			
			}				
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\메인닫기.png
			if(ErrorLevel = 0) {
				printLog("메인닫기 ( " . FoundX . ", " . FoundY . ")")
				leftClick(FoundX, FoundY)
				Sleep, 1000			
			}						
		}
	}	
}

; Button시작:
Button시작:
{
	
	gui, submit, nohide
		
	StartFlag := True
	printLog("시작")
	
	global WindowName := WindowName
	global pos_x := 0
	global pos_y := 0
	global x_right := 0
	global y_right := 0
	
	
	
	
	gui, submit, nohide
	WinGetPos, pos_x, pos_y, width, height, %WindowName%
	x_right := width + pos_x
	y_bottom := height + pos_y		
	
	; 그힐 및 트리플 자동 사용
	SetTimer, TIMER_GREATEHEAL, %GreateHeal%	
	
	; 메세지 확인, 1시간 30분 간격
	SetTimer, TIMER_MESSAGE, 5500000	
	

	while(StartFlag)
	{	

		gui, submit, nohide
		WinGetPos, pos_x, pos_y, width, height, %WindowName%
		x_right := width + pos_x
		y_bottom := height + pos_y	

		gosub, 노물약
		
		gosub, 노화살
		
		gosub, 죽음
		
		gosub, 뒤치기

		;gosub, 월드보스
		Sleep, 200

	}

	
}
return


Button중지:
{
	StartFlag := False
	SetTimer, TIMER_GREATEHEAL, Off 	
	printLog("매크로중지")	
}
return


Button종료:
{
	gui, submit, nohide
	IniWrite, %WindowName%, %A_ScriptDir%\setting.ini, WindowName, name
	IniWrite, %ClassName%, %A_ScriptDir%\setting.ini, ClassName , name
	IniWrite, %PlayName%, %A_ScriptDir%\setting.ini, PlayName, name 
	IniWrite, %Arrow%, %A_ScriptDir%\setting.ini, Count, Arrow 
	IniWrite, %Potion%, %A_ScriptDir%\setting.ini, Count, Potion
	IniWrite, %GreenPotion%, %A_ScriptDir%\setting.ini, Count, GreenPotion 
	IniWrite, %PuplePotion%, %A_ScriptDir%\setting.ini, Count, PuplePotion
	IniWrite, %BluePotion%, %A_ScriptDir%\setting.ini, Count, BluePotion 
	IniWrite, %TransformOrder%, %A_ScriptDir%\setting.ini, Count, TransformOrder
	IniWrite, %ReturnOrder%, %A_ScriptDir%\setting.ini, Count, ReturnOrder
	IniWrite, %DollOrder%, %A_ScriptDir%\setting.ini, Count, DollOrder
	IniWrite, %Elven%, %A_ScriptDir%\setting.ini, Count, Elven
	IniWrite, %GreateHeal%, %A_ScriptDir%\setting.ini, Time, GreateHeal

	ExitApp
}
return

노물약:
	; 물약 체크
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\노물약.png
	if(ErrorLevel = 0) {
		printLog("노물약 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\귀환.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("귀환 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			gosub, 화전민마을찾기
			
			gosub, 잡화상찾기
			
			gosub, 쇼핑하기
			
			gosub, 사냥터이동
		}

	}
return	

노화살:
	; 은화살 체크
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\노화살.png
	if(ErrorLevel = 0) {
		printLog("노화살 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\귀환.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("귀환 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			gosub, 화전민마을찾기
			
			gosub, 잡화상찾기
			
			gosub, 쇼핑하기_은화살
			
			gosub, 사냥터이동
		}

	}
return	

죽음:
	; 죽음
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\재시작.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("재시작 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 6000		
		
		gosub, 화전민마을찾기
		
		gosub, 사냥터이동
	}
return

뒤치기:
	; pk 체크
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *40 *TransBlack %A_ScriptDir%\Image\뒤치기.png
	if(ErrorLevel = 0) {
		printLog("뒤치기 ( " . FoundX . ", " . FoundY . ")")
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\순간이동.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("순간이동 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 10000					
		}				
	}
return

하이네마을찾기:
	;지도
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
	if(ErrorLevel = 0) {
		leftClick(FoundX-40, FoundY-40)
		printLog("지도 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 3000

		;전체맵 찾아서 드래그
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\전체맵.png
		if(ErrorLevel = 0) {
			DragClick(FoundX, FoundY+100, 100)
			printLog("최상단으로 스크롤 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			X := FoundX
			Y := FoundY+100		
			printLog("아래로 천천히 스크롤 ( " . X . ", " . Y . ")")			
			
			while(true) {
				DragClick(X, Y, -10)
				Sleep, 2000
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\하이네마을.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("하이네마을 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 2000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\이동하기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("이동하기 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
						
						break
					}
				}
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\하이네마을2.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("여기가 하이네마을 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 3000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\닫기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("지도닫기 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 2000
						
						break
					}									
					
				}							
				
				
			}							
		}	
	}
return

화전민마을찾기:
	;지도
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
	if(ErrorLevel = 0) {
		leftClick(FoundX-40, FoundY-40)
		printLog("지도 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 3000

		;전체맵 찾아서 드래그
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\전체맵.png
		if(ErrorLevel = 0) {
			DragClick(FoundX, FoundY+250, -200)
			printLog("최하단으로 스크롤 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			X := FoundX
			Y := FoundY+250		
			printLog("아래로 천천히 스크롤 ( " . X . ", " . Y . ")")			
			
			while(true) {
				DragClick(X, Y, -200)
				Sleep, 2000
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\화전민마을.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("화전민마을 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 2000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\이동하기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("이동하기 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
						
						break
					}
				}
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\화전민마을2.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("여기가 화전민마을 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 3000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\닫기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("지도닫기 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 2000					
					
						break
					}									
					
				}							
				
				
			}							
		}	
	}
return

잡화상찾기:
	findJobHwa := true
	; 귀환후 잡화상 찾을 때까지 
	while(findJobHwa) {
		
		x := pos_x + 400
		y := pos_y + 200
		
		WinGetPos, w_x, w_y, w_w, w_h, %WindowName%
	
		innerX := x - w_x
		innerY := Y - w_y - 35
		
		lparam := innerX | innerY << 16
		PostMessage, 0x201, 1, %lparam%, , %WindowName%	
		sleep, 2000
		PostMessage, 0x202, 0, %lparam%, , %WindowName%
		sleep, 1000
		
		while(true) {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\잡화상이름.png
			if(ErrorLevel = 0) {
				leftClick(FoundX, FoundY)
				printLog("잡화상이름 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 3000
				findJobHwa := false
				break
			} else {
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\잡화상이름2.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("잡화상이름2 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 3000	
					findJobHwa := false
					break							
				}
			}
			if(A_Index > 5) {
				break
			}
		}

		if(findJobHwa = false) {
			printLog("잡화상 찾음")
			Sleep, 1000
			break
		}	
	} ; 잡화상 찾음 
return

쇼핑하기:
	; 인벤토리 모드로 전환
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\인벤토리모드.png
	if(ErrorLevel = 0) {								
		leftClick(FoundX, FoundY)
		printLog("인벤토리모드 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000
	} else {
		; 인벤토리 모드로 전환
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\인벤토리모드2.png
		if(ErrorLevel = 0) {								
			leftClick(FoundX, FoundY)
			printLog("인벤토리모드2 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 2000
		} 				
	}
	
	; 인벤토리 모드로 전환
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\전체.png
	if(ErrorLevel = 0) {								
		leftClick(FoundX, FoundY)
		printLog("전체 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000
	} 				
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\빨간물약.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("빨간물약 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %Potion% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\백개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("백개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}		
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\강촐.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("강촐 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %GreenPotion% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\열개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("열개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\용기.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("용기 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %PuplePotion% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\열개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("열개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}		

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\마나회복물약.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("마나회복물약 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %BluePotion% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\열개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("열개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}	
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\변신주문서.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("변신주문서 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %TransformOrder% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\열개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("열개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}				
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\귀환주문서.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("귀환주문서 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %ReturnOrder% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\열개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("열개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}		

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\마법인형.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("마법인형 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %DollOrder% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\열개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("열개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\와퍼.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("와퍼 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %Elven% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\열개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("열개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}				
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\기타.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("기타 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\은화살.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("은화살 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 1000

			Loop, %Arrow% {
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\천개.png
				if(ErrorLevel = 0) {	
					leftClick(FoundX, FoundY)
					printLog("천개 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 500
				}
			}				
		}	
	}					

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\모두구매.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("모두구매 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000				
	}			

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\구매확인.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("구매확인 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000		
	}			


	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\닫기.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("닫기 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000		
	}	
return

쇼핑하기_은화살:
	; 인벤토리 모드로 전환
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\인벤토리모드.png
	if(ErrorLevel = 0) {								
		leftClick(FoundX, FoundY)
		printLog("인벤토리모드 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000
	} else {
		; 인벤토리 모드로 전환
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\인벤토리모드2.png
		if(ErrorLevel = 0) {								
			leftClick(FoundX, FoundY)
			printLog("인벤토리모드2 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 2000
		} 				
	}
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\기타.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("기타 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000
	}	

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\은화살.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("은화살 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %Arrow% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\천개.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("천개 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}	

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\모두구매.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("모두구매 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000				
	}			

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\구매확인.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("구매확인 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000		
	}			


	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\닫기.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("닫기 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000		
	}		
return

사냥터이동:
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
	if(ErrorLevel = 0) {
		leftClick(FoundX-40, FoundY-40)
		printLog("지도 ( " . FoundX . ", " . FoundY . ")")
		Sleep, 3000
	}		

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\전체맵.png
	if(ErrorLevel = 0) {
		DragClick(FoundX, FoundY+100, 30)
		X := FoundX
		Y := FoundY+100
		printLog("위로 천천히 스크롤 ( " . X . ", " . Y . ")")		
		
		findPlay := true
		
		while(findPlay) {

			DragClick(X, Y, 30)
			Sleep, 3000
			
			;사냥터 잘못 찾아서 여러 처리함
			while(true) {
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\%PlayName%.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("찾음 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 1000		
					
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\이동하기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("이동하기 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 4000					
					}
					
					;지도찾아서 상대좌표로 오토 버튼 누르기
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
					if(ErrorLevel = 0) {
						leftClick(FoundX-175, FoundY+145)
						printLog("오토 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 1000
					}			
					
					findPlay := false
					break
				}				
				
				if(A_Index > 5) {
					break
				}
			}

			if(findPlay = false) {
				printLog("맵찾음")
				Sleep, 1000
				break
			}				
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\개미굴입구.png
			if(ErrorLevel = 0) {
				printLog("개미굴입구찾음 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 1000		
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\닫기.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("지도닫기 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 3000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
					if(ErrorLevel = 0) {
						leftClick(FoundX-40, FoundY-40)
						printLog("지도 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
					}										
				}																
			}						
		}
	}	
return

월드보스:
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\월드보스.png
	if(ErrorLevel = 0) {
		Sleep, 1000

		; 55분에서 59분 사이에만
		if((A_Hour = 12 && A_Min > 55) && (A_Hour = 12 && A_MIN < 59)) {
			printLog("월드보스 ( " . FoundX . ", " . FoundY . ")" . A_MIN)
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\귀환.png
			if(ErrorLevel = 0) {
				leftClick(FoundX, FoundY)
				printLog("귀환 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 3000			
			}
		
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\월드보스.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("월드보스선택 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			while(true) {
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\보스전입장.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("보스전 입장 ( " . FoundX . ", " . FoundY . ")")
					
					Sleep, 3000	
				}
				
				leftClick(pos_x+450, pos_y+230)
				sleep, 2000
				
				if(A_MIN >= 59) {
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\촐기먹기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("촐기먹기 ( " . FoundX . ", " . FoundY . ")")
						
						Sleep, 1000	
					}	
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\강촐먹기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("강촐먹기 ( " . FoundX . ", " . FoundY . ")")
						
						Sleep, 1000	
					}							

					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\용기먹기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("용기먹기 ( " . FoundX . ", " . FoundY . ")")
						
						Sleep, 1000	
					}	
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\윈드워크쓰기.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("윈드워크쓰기 ( " . FoundX . ", " . FoundY . ")")
						
						Sleep, 1000	
					}							
					
					Sleep, 60000
					
					break
				}
			}

			

			;지도찾아서 상대좌표로 오토 버튼 누르기
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
			if(ErrorLevel = 0) {
				leftClick(FoundX-175, FoundY+145)
				printLog("오토 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 1000
				
				;5분이 되면 마을 귀환
				while(true) {
					if(A_Min > 4 && A_Min < 45) {
						break
					} else {
						Sleep, 3000
					}
				}
				
				; 죽음
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\재시작.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("재시작 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 5000		
				}						
		
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\귀환.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("귀환 ( " . FoundX . ", " . FoundY . ")")
					Sleep, 5000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
					if(ErrorLevel = 0) {
						leftClick(FoundX-40, FoundY-40)
						printLog("지도 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
					}		

					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\전체맵.png
					if(ErrorLevel = 0) {
						DragClick(FoundX, FoundY+100, 100)
						printLog("최상단으로 스크롤 ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
						
						X := FoundX
						Y := FoundY+100
						printLog("아래로 천천히 스크롤 ( " . X . ", " . Y . ")")	
						
						while(true) {
							DragClick(X, Y, -15)				
							Sleep, 3000
							
							ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\%PlayName%.png
							if(ErrorLevel = 0) {
								leftClick(FoundX, FoundY)
								printLog("찾음 ( " . FoundX . ", " . FoundY . ")")
								Sleep, 1000		
								
								ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\이동하기.png
								if(ErrorLevel = 0) {
									leftClick(FoundX, FoundY)
									printLog("이동하기 ( " . FoundX . ", " . FoundY . ")")
									Sleep, 6000					
								}
								
								;지도찾아서 상대좌표로 오토 버튼 누르기
								ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
								if(ErrorLevel = 0) {
									leftClick(FoundX-175, FoundY+145)
									printLog("오토 ( " . FoundX . ", " . FoundY . ")")
									Sleep, 1000
								}							
								
								break
							}
							
							ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\개미굴입구2.png
							if(ErrorLevel = 0) {
								printLog("개미굴입구찾음 ( " . FoundX . ", " . FoundY . ")")
								Sleep, 1000		
								
								ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\닫기.png
								if(ErrorLevel = 0) {
									leftClick(FoundX, FoundY)
									printLog("지도닫기 ( " . FoundX . ", " . FoundY . ")")
									Sleep, 3000
									
									ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\지도2.png
									if(ErrorLevel = 0) {
										leftClick(FoundX-40, FoundY-40)
										printLog("지도 ( " . FoundX . ", " . FoundY . ")")
										Sleep, 3000
									}										
								}																
							}									
						}
					}									
				}
			}					
							
		}	

		}
		
	}
return

; pk 체크
pkCheck(pos_x, pos_y, x_right, y_bottom) {
	; 뒤치기
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\뒤치기.png
	if(ErrorLevel = 0) {
		printLog("뒤치기 ( %FoundX%, %FoundY% )")
		Sleep, 1000	
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\귀환.png
		if(ErrorLevel = 0) {
			;leftClick(FoundX, FoundY)
			printLog("귀환 ( %FoundX%, %FoundY% )")
			Sleep, 1000	
		}
	}	
}

; 로그 쌓기
printLog(vStr) {
	formattime , nowtime,,yyyy-MM-dd HH:mm:ss
	guicontrol ,,l_b, %nowtime% : %vStr% . ||	
}

; 비활성 마우스 클릭 함수
leftClick(cX, cY) {
	WinGetPos, w_x, w_y, w_w, w_h, %WindowName%
	
	innerX := cX - w_x
	innerY := cY - w_y
	
	lparam := innerX | innerY << 16
	PostMessage, 0x201, 1, %lparam%, , %WindowName%
	PostMessage, 0x202, 0, %lparam%, , %WindowName%

	Sleep, 100
	
}

; 비활성 마우스 드래그 함수
DragClick(cX, cY, cUpDown) {
	WinGetPos, w_x, w_y, w_w, w_h, %WindowName%
	
	innerX := cX - w_x
	innerY := cY - w_y
	
	lparam := innerX | innerY << 16
	lyparam := innerX | innerY + cUpDown << 16
	PostMessage, 0x201, 1, %lparam%, , %WindowName%
	Sleep, 100
	PostMessage, 0x201, 1, %lyparam%, , %WindowName%

	Sleep, 200
	PostMessage, 0x202, 0, %lyparam%, , %WindowName%
}

