/*
* ������ m 1.1v
*/
; Ŭ���� ����Ʈ
ClassList=���|����
IniRead OutputVar, %A_ScriptDir%\setting.ini, ClassName, name
StringReplace, ClassList, ClassList, %OutputVar%, %OutputVar%| 

; ����� ����Ʈ
PlayList=�÷��ǽ�|����������|�����ʵ�|�и�����|�ſ��ǽ�|�����ұ�|�߸��ǽ�����|��ũ����������|���̳״�����|ǳ���ǻ���|������ǾȽ�ó
IniRead OutputVar, %A_ScriptDir%\setting.ini, PlayName, name
StringReplace, PlayList, PlayList, %OutputVar%, %OutputVar%| 

Gui, Add, Text, x20 y20 w80 h20, â�̸� : 
Gui, Add, Edit, x100 y15 w60 h20 vWindowName

Gui, Add, Text, x20 y40 w80 h20, Ŭ�������� : 
Gui, Add, DropDownList, x100 y35 w70 h60 vClassName, %ClassList%

Gui, Add, Text, x20 y60 w80 h20, ����ͼ��� :
Gui, Add, DropDownList, x100 y55 w300 h200 vPlayName, %PlayList%

Gui, Add, Text, x20 y80 w80 h20, ��ȭ��
Gui, Add, Edit, x100 y75 w40 h20 vArrow

Gui, Add, Text, x20 y100 w80 h20, ü��ȸ����
Gui, Add, Edit, x100 y95 w40 h20 vPotion

Gui, Add, Text, x20 y120 w80 h20, ����
Gui, Add, Edit, x100 y115 w40 h20 vGreenPotion

Gui, Add, Text, x20 y140 w80 h20, ���
Gui, Add, Edit, x100 y135 w40 h20 vPuplePotion

Gui, Add, Text, x150 y80 w80 h20, ����ȸ������
Gui, Add, Edit, x230 y75 w40 h20 vBluePotion

Gui, Add, Text, x150 y100 w80 h20, �����ֹ���
Gui, Add, Edit, x230 y95 w40 h20 vTransformOrder

Gui, Add, Text, x150 y120 w80 h20, ��ȯ�ֹ���
Gui, Add, Edit, x230 y115 w40 h20 vReturnOrder

Gui, Add, Text, x150 y140 w80 h20, ��������
Gui, Add, Edit, x230 y135 w40 h20 vDollOrder

Gui, Add, Text, x280 y80 w80 h20, �������
Gui, Add, Edit, x360 y75 w40 h20 vElven

Gui, Add, Text, x280 y100 w80 h20, ���� ����
Gui, Add, Edit, x360 y95 w40 h20 vGreateHeal

Gui, Add, ListBox, x20 y160 w400 h100 vl_b

Gui, Add, Button, x60 y270 w110 h20, ����
Gui, Add, Button, x180 y270 w110 h20, ����
Gui, Add, Button, x300 y270 w110 h20, ����
Gui, Show

;â�̸� �ҷ�����
IniRead OutputVar, %A_ScriptDir%\setting.ini, WindowName, name
GuiControl, , WindowName,  %OutputVar%

;ȭ�� ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, Arrow
GuiControl, , Arrow, %OutputVar%

;���� ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, Potion
GuiControl, , Potion, %OutputVar%

;���� ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, GreenPotion
GuiControl, , GreenPotion, %OutputVar%

;��� ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, PuplePotion
GuiControl, , PuplePotion, %OutputVar%

;����ȸ������ ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, BluePotion
GuiControl, , BluePotion, %OutputVar%

;���� ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, TransformOrder
GuiControl, , TransformOrder, %OutputVar%

;��ȯ ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, ReturnOrder
GuiControl, , ReturnOrder, %OutputVar%

;�������� ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, DollOrder
GuiControl, , DollOrder, %OutputVar%

;���� ���� ����
IniRead OutputVar, %A_ScriptDir%\setting.ini, Count, Elven
GuiControl, , Elven, %OutputVar%

;���� �� ����
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

; ���� ����
GreateHeal() {
	gui, submit, nohide
	WinGetPos, pos_x, pos_y, width, height, %WindowName%
	x_right := width + pos_x
	y_bottom := height + pos_y	
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\����.png
	if(ErrorLevel = 0) {
		;printLog("����")
		leftClick(FoundX, FoundY)
	}	
	Sleep, 2000
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\Ʈ����.png
	if(ErrorLevel = 0) {
		;printLog("����")
		leftClick(FoundX, FoundY)
	}		
	
}

TIMER_MESSAGE:
	MessageCheck()
Return

; �޼���Ȯ��
MessageCheck() {
	gui, submit, nohide
	WinGetPos, pos_x, pos_y, width, height, %WindowName%
	x_right := width + pos_x
	y_bottom := height + pos_y	
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\�޼����˸�.png
	if(ErrorLevel = 0) {
		printLog("�޼����˸�")
		leftClick(FoundX, FoundY)
		Sleep, 2000
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\������.png
		if(ErrorLevel = 0) {
			printLog("������")		
			leftClick(FoundX, FoundY)
			Sleep, 2000
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ιޱ�.png
			if(ErrorLevel = 0) {
				printLog("��ιޱ� ( " . FoundX . ", " . FoundY . ")")
				leftClick(FoundX, FoundY)
				Sleep, 3000			
			}
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�޼����Դݱ�.png
			if(ErrorLevel = 0) {
				printLog("�ݱ� ( " . FoundX . ", " . FoundY . ")")
				leftClick(FoundX, FoundY)
				Sleep, 3000			
			}				
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\���δݱ�.png
			if(ErrorLevel = 0) {
				printLog("���δݱ� ( " . FoundX . ", " . FoundY . ")")
				leftClick(FoundX, FoundY)
				Sleep, 1000			
			}						
		}
	}	
}

; Button����:
Button����:
{
	
	gui, submit, nohide
		
	StartFlag := True
	printLog("����")
	
	global WindowName := WindowName
	global pos_x := 0
	global pos_y := 0
	global x_right := 0
	global y_right := 0
	
	
	
	
	gui, submit, nohide
	WinGetPos, pos_x, pos_y, width, height, %WindowName%
	x_right := width + pos_x
	y_bottom := height + pos_y		
	
	; ���� �� Ʈ���� �ڵ� ���
	SetTimer, TIMER_GREATEHEAL, %GreateHeal%	
	
	; �޼��� Ȯ��, 1�ð� 30�� ����
	SetTimer, TIMER_MESSAGE, 5500000	
	

	while(StartFlag)
	{	

		gui, submit, nohide
		WinGetPos, pos_x, pos_y, width, height, %WindowName%
		x_right := width + pos_x
		y_bottom := height + pos_y	

		gosub, �빰��
		
		gosub, ��ȭ��
		
		gosub, ����
		
		gosub, ��ġ��

		;gosub, ���庸��
		Sleep, 200

	}

	
}
return


Button����:
{
	StartFlag := False
	SetTimer, TIMER_GREATEHEAL, Off 	
	printLog("��ũ������")	
}
return


Button����:
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

�빰��:
	; ���� üũ
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\�빰��.png
	if(ErrorLevel = 0) {
		printLog("�빰�� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��ȯ.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("��ȯ ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			gosub, ȭ���θ���ã��
			
			gosub, ��ȭ��ã��
			
			gosub, �����ϱ�
			
			gosub, ������̵�
		}

	}
return	

��ȭ��:
	; ��ȭ�� üũ
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ȭ��.png
	if(ErrorLevel = 0) {
		printLog("��ȭ�� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��ȯ.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("��ȯ ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			gosub, ȭ���θ���ã��
			
			gosub, ��ȭ��ã��
			
			gosub, �����ϱ�_��ȭ��
			
			gosub, ������̵�
		}

	}
return	

����:
	; ����
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�����.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("����� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 6000		
		
		gosub, ȭ���θ���ã��
		
		gosub, ������̵�
	}
return

��ġ��:
	; pk üũ
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *40 *TransBlack %A_ScriptDir%\Image\��ġ��.png
	if(ErrorLevel = 0) {
		printLog("��ġ�� ( " . FoundX . ", " . FoundY . ")")
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�����̵�.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("�����̵� ( " . FoundX . ", " . FoundY . ")")
			Sleep, 10000					
		}				
	}
return

���̳׸���ã��:
	;����
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
	if(ErrorLevel = 0) {
		leftClick(FoundX-40, FoundY-40)
		printLog("���� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 3000

		;��ü�� ã�Ƽ� �巡��
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ü��.png
		if(ErrorLevel = 0) {
			DragClick(FoundX, FoundY+100, 100)
			printLog("�ֻ������ ��ũ�� ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			X := FoundX
			Y := FoundY+100		
			printLog("�Ʒ��� õõ�� ��ũ�� ( " . X . ", " . Y . ")")			
			
			while(true) {
				DragClick(X, Y, -10)
				Sleep, 2000
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\���̳׸���.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("���̳׸��� ( " . FoundX . ", " . FoundY . ")")
					Sleep, 2000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�̵��ϱ�.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("�̵��ϱ� ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
						
						break
					}
				}
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\���̳׸���2.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("���Ⱑ ���̳׸��� ( " . FoundX . ", " . FoundY . ")")
					Sleep, 3000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�ݱ�.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("�����ݱ� ( " . FoundX . ", " . FoundY . ")")
						Sleep, 2000
						
						break
					}									
					
				}							
				
				
			}							
		}	
	}
return

ȭ���θ���ã��:
	;����
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
	if(ErrorLevel = 0) {
		leftClick(FoundX-40, FoundY-40)
		printLog("���� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 3000

		;��ü�� ã�Ƽ� �巡��
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ü��.png
		if(ErrorLevel = 0) {
			DragClick(FoundX, FoundY+250, -200)
			printLog("���ϴ����� ��ũ�� ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			X := FoundX
			Y := FoundY+250		
			printLog("�Ʒ��� õõ�� ��ũ�� ( " . X . ", " . Y . ")")			
			
			while(true) {
				DragClick(X, Y, -200)
				Sleep, 2000
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\ȭ���θ���.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("ȭ���θ��� ( " . FoundX . ", " . FoundY . ")")
					Sleep, 2000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�̵��ϱ�.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("�̵��ϱ� ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
						
						break
					}
				}
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\ȭ���θ���2.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("���Ⱑ ȭ���θ��� ( " . FoundX . ", " . FoundY . ")")
					Sleep, 3000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�ݱ�.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("�����ݱ� ( " . FoundX . ", " . FoundY . ")")
						Sleep, 2000					
					
						break
					}									
					
				}							
				
				
			}							
		}	
	}
return

��ȭ��ã��:
	findJobHwa := true
	; ��ȯ�� ��ȭ�� ã�� ������ 
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
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ȭ���̸�.png
			if(ErrorLevel = 0) {
				leftClick(FoundX, FoundY)
				printLog("��ȭ���̸� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 3000
				findJobHwa := false
				break
			} else {
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ȭ���̸�2.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("��ȭ���̸�2 ( " . FoundX . ", " . FoundY . ")")
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
			printLog("��ȭ�� ã��")
			Sleep, 1000
			break
		}	
	} ; ��ȭ�� ã�� 
return

�����ϱ�:
	; �κ��丮 ���� ��ȯ
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�κ��丮���.png
	if(ErrorLevel = 0) {								
		leftClick(FoundX, FoundY)
		printLog("�κ��丮��� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000
	} else {
		; �κ��丮 ���� ��ȯ
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�κ��丮���2.png
		if(ErrorLevel = 0) {								
			leftClick(FoundX, FoundY)
			printLog("�κ��丮���2 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 2000
		} 				
	}
	
	; �κ��丮 ���� ��ȯ
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��ü.png
	if(ErrorLevel = 0) {								
		leftClick(FoundX, FoundY)
		printLog("��ü ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000
	} 				
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��������.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("�������� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %Potion% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\�鰳.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("�鰳 ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}		
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("���� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %GreenPotion% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("���� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\���.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("��� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %PuplePotion% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("���� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}		

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����ȸ������.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("����ȸ������ ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %BluePotion% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("���� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}	
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\�����ֹ���.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("�����ֹ��� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %TransformOrder% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("���� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}				
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ȯ�ֹ���.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("��ȯ�ֹ��� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %ReturnOrder% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("���� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}		

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��������.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("�������� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %DollOrder% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("���� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("���� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %Elven% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("���� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}				
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��Ÿ.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("��Ÿ ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ȭ��.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("��ȭ�� ( " . FoundX . ", " . FoundY . ")")
			Sleep, 1000

			Loop, %Arrow% {
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\õ��.png
				if(ErrorLevel = 0) {	
					leftClick(FoundX, FoundY)
					printLog("õ�� ( " . FoundX . ", " . FoundY . ")")
					Sleep, 500
				}
			}				
		}	
	}					

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��α���.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("��α��� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000				
	}			

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\����Ȯ��.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("����Ȯ�� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000		
	}			


	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�ݱ�.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("�ݱ� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000		
	}	
return

�����ϱ�_��ȭ��:
	; �κ��丮 ���� ��ȯ
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�κ��丮���.png
	if(ErrorLevel = 0) {								
		leftClick(FoundX, FoundY)
		printLog("�κ��丮��� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000
	} else {
		; �κ��丮 ���� ��ȯ
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�κ��丮���2.png
		if(ErrorLevel = 0) {								
			leftClick(FoundX, FoundY)
			printLog("�κ��丮���2 ( " . FoundX . ", " . FoundY . ")")
			Sleep, 2000
		} 				
	}
	
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��Ÿ.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("��Ÿ ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000
	}	

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ȭ��.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("��ȭ�� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 1000

		Loop, %Arrow% {
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\õ��.png
			if(ErrorLevel = 0) {	
				leftClick(FoundX, FoundY)
				printLog("õ�� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 500
			}
		}				
	}	

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��α���.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("��α��� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000				
	}			

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\����Ȯ��.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("����Ȯ�� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000		
	}			


	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�ݱ�.png
	if(ErrorLevel = 0) {
		leftClick(FoundX, FoundY)
		printLog("�ݱ� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 2000		
	}		
return

������̵�:
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
	if(ErrorLevel = 0) {
		leftClick(FoundX-40, FoundY-40)
		printLog("���� ( " . FoundX . ", " . FoundY . ")")
		Sleep, 3000
	}		

	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ü��.png
	if(ErrorLevel = 0) {
		DragClick(FoundX, FoundY+100, 30)
		X := FoundX
		Y := FoundY+100
		printLog("���� õõ�� ��ũ�� ( " . X . ", " . Y . ")")		
		
		findPlay := true
		
		while(findPlay) {

			DragClick(X, Y, 30)
			Sleep, 3000
			
			;����� �߸� ã�Ƽ� ���� ó����
			while(true) {
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\%PlayName%.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("ã�� ( " . FoundX . ", " . FoundY . ")")
					Sleep, 1000		
					
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�̵��ϱ�.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("�̵��ϱ� ( " . FoundX . ", " . FoundY . ")")
						Sleep, 4000					
					}
					
					;����ã�Ƽ� �����ǥ�� ���� ��ư ������
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
					if(ErrorLevel = 0) {
						leftClick(FoundX-175, FoundY+145)
						printLog("���� ( " . FoundX . ", " . FoundY . ")")
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
				printLog("��ã��")
				Sleep, 1000
				break
			}				
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\���̱��Ա�.png
			if(ErrorLevel = 0) {
				printLog("���̱��Ա�ã�� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 1000		
				
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�ݱ�.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("�����ݱ� ( " . FoundX . ", " . FoundY . ")")
					Sleep, 3000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
					if(ErrorLevel = 0) {
						leftClick(FoundX-40, FoundY-40)
						printLog("���� ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
					}										
				}																
			}						
		}
	}	
return

���庸��:
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\���庸��.png
	if(ErrorLevel = 0) {
		Sleep, 1000

		; 55�п��� 59�� ���̿���
		if((A_Hour = 12 && A_Min > 55) && (A_Hour = 12 && A_MIN < 59)) {
			printLog("���庸�� ( " . FoundX . ", " . FoundY . ")" . A_MIN)
			
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��ȯ.png
			if(ErrorLevel = 0) {
				leftClick(FoundX, FoundY)
				printLog("��ȯ ( " . FoundX . ", " . FoundY . ")")
				Sleep, 3000			
			}
		
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\���庸��.png
		if(ErrorLevel = 0) {
			leftClick(FoundX, FoundY)
			printLog("���庸������ ( " . FoundX . ", " . FoundY . ")")
			Sleep, 3000

			while(true) {
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����������.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("������ ���� ( " . FoundX . ", " . FoundY . ")")
					
					Sleep, 3000	
				}
				
				leftClick(pos_x+450, pos_y+230)
				sleep, 2000
				
				if(A_MIN >= 59) {
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�ͱ�Ա�.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("�ͱ�Ա� ( " . FoundX . ", " . FoundY . ")")
						
						Sleep, 1000	
					}	
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\���͸Ա�.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("���͸Ա� ( " . FoundX . ", " . FoundY . ")")
						
						Sleep, 1000	
					}							

					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\���Ա�.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("���Ա� ( " . FoundX . ", " . FoundY . ")")
						
						Sleep, 1000	
					}	
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�����ũ����.png
					if(ErrorLevel = 0) {
						leftClick(FoundX, FoundY)
						printLog("�����ũ���� ( " . FoundX . ", " . FoundY . ")")
						
						Sleep, 1000	
					}							
					
					Sleep, 60000
					
					break
				}
			}

			

			;����ã�Ƽ� �����ǥ�� ���� ��ư ������
			ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
			if(ErrorLevel = 0) {
				leftClick(FoundX-175, FoundY+145)
				printLog("���� ( " . FoundX . ", " . FoundY . ")")
				Sleep, 1000
				
				;5���� �Ǹ� ���� ��ȯ
				while(true) {
					if(A_Min > 4 && A_Min < 45) {
						break
					} else {
						Sleep, 3000
					}
				}
				
				; ����
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�����.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("����� ( " . FoundX . ", " . FoundY . ")")
					Sleep, 5000		
				}						
		
				ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��ȯ.png
				if(ErrorLevel = 0) {
					leftClick(FoundX, FoundY)
					printLog("��ȯ ( " . FoundX . ", " . FoundY . ")")
					Sleep, 5000
					
					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
					if(ErrorLevel = 0) {
						leftClick(FoundX-40, FoundY-40)
						printLog("���� ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
					}		

					ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\��ü��.png
					if(ErrorLevel = 0) {
						DragClick(FoundX, FoundY+100, 100)
						printLog("�ֻ������ ��ũ�� ( " . FoundX . ", " . FoundY . ")")
						Sleep, 3000
						
						X := FoundX
						Y := FoundY+100
						printLog("�Ʒ��� õõ�� ��ũ�� ( " . X . ", " . Y . ")")	
						
						while(true) {
							DragClick(X, Y, -15)				
							Sleep, 3000
							
							ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *70 *TransBlack %A_ScriptDir%\Image\%PlayName%.png
							if(ErrorLevel = 0) {
								leftClick(FoundX, FoundY)
								printLog("ã�� ( " . FoundX . ", " . FoundY . ")")
								Sleep, 1000		
								
								ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�̵��ϱ�.png
								if(ErrorLevel = 0) {
									leftClick(FoundX, FoundY)
									printLog("�̵��ϱ� ( " . FoundX . ", " . FoundY . ")")
									Sleep, 6000					
								}
								
								;����ã�Ƽ� �����ǥ�� ���� ��ư ������
								ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
								if(ErrorLevel = 0) {
									leftClick(FoundX-175, FoundY+145)
									printLog("���� ( " . FoundX . ", " . FoundY . ")")
									Sleep, 1000
								}							
								
								break
							}
							
							ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\���̱��Ա�2.png
							if(ErrorLevel = 0) {
								printLog("���̱��Ա�ã�� ( " . FoundX . ", " . FoundY . ")")
								Sleep, 1000		
								
								ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\�ݱ�.png
								if(ErrorLevel = 0) {
									leftClick(FoundX, FoundY)
									printLog("�����ݱ� ( " . FoundX . ", " . FoundY . ")")
									Sleep, 3000
									
									ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 *TransBlack %A_ScriptDir%\Image\����2.png
									if(ErrorLevel = 0) {
										leftClick(FoundX-40, FoundY-40)
										printLog("���� ( " . FoundX . ", " . FoundY . ")")
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

; pk üũ
pkCheck(pos_x, pos_y, x_right, y_bottom) {
	; ��ġ��
	ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��ġ��.png
	if(ErrorLevel = 0) {
		printLog("��ġ�� ( %FoundX%, %FoundY% )")
		Sleep, 1000	
		
		ImageSearch, FoundX, FoundY, %pos_x%, %pos_y%, %x_right%, %y_bottom%, *50 %A_ScriptDir%\Image\��ȯ.png
		if(ErrorLevel = 0) {
			;leftClick(FoundX, FoundY)
			printLog("��ȯ ( %FoundX%, %FoundY% )")
			Sleep, 1000	
		}
	}	
}

; �α� �ױ�
printLog(vStr) {
	formattime , nowtime,,yyyy-MM-dd HH:mm:ss
	guicontrol ,,l_b, %nowtime% : %vStr% . ||	
}

; ��Ȱ�� ���콺 Ŭ�� �Լ�
leftClick(cX, cY) {
	WinGetPos, w_x, w_y, w_w, w_h, %WindowName%
	
	innerX := cX - w_x
	innerY := cY - w_y
	
	lparam := innerX | innerY << 16
	PostMessage, 0x201, 1, %lparam%, , %WindowName%
	PostMessage, 0x202, 0, %lparam%, , %WindowName%

	Sleep, 100
	
}

; ��Ȱ�� ���콺 �巡�� �Լ�
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

