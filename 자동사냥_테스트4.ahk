#include Gdip.ahk		
#include Gdip_ImageSearch.ahk
#include Search_img.ahk		
;~ ��Ȱ�� �̹��� ��ġ ���
#include desert_gui.ahk		; GUI ���
#include MouseClick.ahk		; ���콺 Ŭ�� ���
#include globalXY.ahk		; ��ġ ��ǥ ��� (global ����)
#include common.ahk

#include start_desert.ahk	; ���� �� ���� ��� ( �ǾƷ� �Լ� ) ƨ���� �� ������ �׽�Ʈ ��
#include ũ��ī.ahk			; ������ġ (ũ��ī) - ���
#include repeat.ahk			; ������ġ (�ڵ����) - ���
;~ #include repeat�׽�Ʈ.ahk	; �ڵ���� �׽�Ʈ
#include fishing.ahk		; ������ġ (����) - ���
#include MQuest.ahk			; ������ġ (������) - ���
#include suppress.ahk		; ������ġ (���) - ���

global �ݺ�Ƚ�� := �ݺ�Ƚ��
global ��Ŭ����Ƚ�� := 0
global PixieEatLimit 
global fishing��ũ�ν���		; ���� �ݺ��� true, false
global main��ũ�ν��� 		; ���� ����Ʈ �ݺ��� true, false
global repeat��ũ�ν��� 		; �ڵ���� �ݺ��� true, false
global ũ��ī��ũ�ν��� 		; ũ��ī �ݺ��� true, false
global �����ũ�ν��� 		; ����Ƿ� �ݺ��� true, false

global repPoint 			; ������
global IF_Start_GPS			; ������ġ
global SelectStageNum 	; ����ܰ�
global petEat 			;�����
global crystal
coordmode,pixel,screen
return 

Button����:
{
	Gui, Submit, NoHide
	GuiControl, , A, ����
	
	global WindowName := WinNmEdit	;	���μ��� �̸�
	;~ global Server := StartServer	;	��������_ ����۽� ���
	IF_Start_GPS := StartGPS		;	������ġ_ ������ �Լ�( ahk )�� ����.
	PixieEatLimit := blackPixieEat	;	������ ���� ���� repeat�� ����
	SelectStageNum  := suppressStage ;	����ܰ� �ޱ�
	repPoint := repeatPoint 		; 	������
	petEat := petEatSel				; �����
	crystal := crystalSel			; �����ռ�
	
	WinGet,processId,ID,%WindowName%

	setTimer, StartSearch, 1800000
	startGPS()
}

return
Button����:
{
	Gui, Submit, noHide
	GuiControl, , A, ����
	
	fishing��ũ�ν��� = false
	main��ũ�ν��� = false
	repeat��ũ�ν��� = false
	ũ��ī��ũ�ν��� = false
	�����ũ�ν��� = false
	SetTimer, StartSearch, Off 
}
return 
Button����:
{
	�����Լ�()
}
return

F2::
{
	Gui, Submit, NoHide
	GuiControl, , A, ����
	
	global WindowName := WinNmEdit	;	���μ��� �̸�
	;~ global Server := StartServer	;	��������_ ����۽� ���
	IF_Start_GPS := StartGPS		;	������ġ_ ������ �Լ�( ahk )�� ����.
	PixieEatLimit := blackPixieEat	;	������ ���� ���� repeat�� ����
	SelectStageNum  := suppressStage ;	����ܰ� �ޱ�
	repPoint := repeatPoint 		; 	������
	petEat := petEatSel				;�����
	crystal := crystalSel			; �����ռ�

	WinGet,processId,ID,%WindowName%

	setTimer, StartSearch, 1800000
	startGPS()
}
return 
F3::
{
	Gui, Submit, noHide
	GuiControl, , A, ����
	
	fishing��ũ�ν��� = false
	main��ũ�ν��� = false
	repeat��ũ�ν��� = false
	ũ��ī��ũ�ν��� = false
	�����ũ�ν��� = false
	SetTimer, StartSearch, Off 
}
return
F4::
{
	�����Լ�()
}
return 

�����Լ�()
{
	��ũ�ν��� :=false
	
	Gui, Submit, noHide
	GuiControl, , A, ����
	
	ExitApp
}

return 

startGPS(){
	
	if(IF_Start_GPS == "���ӽ���"){
		���ۼ�ġ()
	}else if(IF_Start_GPS == "��������"){
		��������()
	}else if(IF_Start_GPS == "�ڵ����"){
		repeat��ũ�ν��� = true
		ũ��ī��ũ�ν��� = true
		�ڵ���ɽ���()
	}else if(IF_Start_GPS == "��������"){
		��������()
	}else if(IF_Start_GPS == "������"){
		main��ũ�ν��� = true
		������()
	}else if(IF_Start_GPS == "����"){
		fishing��ũ�ν��� = true
		����()
	}else if(IF_Start_GPS == "ũ��ī"){
		ũ��ī��ũ�ν��� = true
		ũ��ī("N")
	}else if(IF_Start_GPS == "���"){
		�����ũ�ν��� = true
		�������()
	}
}

return 