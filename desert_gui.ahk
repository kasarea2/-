Gui, Add, Text, x0 y0 w70 h20,			;
;~ Gui, Add, text, x500 y200 w480 h20, �����縷 ��ũ��	;
;~ Gui, Add, text, x60 y50 w20 h50 vB, 0ȸ				;

;~ Gui, Add, Edit, x80 y80 w30 h20 v�ݺ�Ƚ��,0		;
;~ Gui, Add, Text, x115 y84 w20 h20, ȸ				;
;~ GUi, Add, CheckBox, x20 y110 w100 h20 v2���̹���Ŭ�� checked, 2���̹���Ŭ��	;
Gui, Add, Text, x30 x20 w70 h20, *������ġ			;
Gui, Add, ComboBox, x80 y20 w150 h100 vStartGPS Choose1, �ڵ����|������|ũ��ī|����|���	 ;
Gui, Add, Text, x250 y25 w80 h20, *���μ��� ��  ;
Gui, Add, Edit, x330 y20 w120 h20 vWinNmEdit,		;

;~ Gui, Add, Text, x20 y65 w70 h20, ���� ���� 		;
;~ Gui, Add, ComboBox, x80 y60 w150 h100 vStartServer Choose1,  ���̵�|Į���|��ȭ�� 	 ;
Gui, Add, Text, x20 y65 w100 h20, ��� ���� ;
Gui, Add, ComboBox, x80 y60 w150 h100 vblackPixieEat Choose5, |ȸ��|�Ͼ��|�ʷϻ�|�Ķ���|�����|�����	 ;
Gui, Add, Text, x250 y65 w100 h20 , ����ǰ��� ;
Gui, Add, ComboBox, x330 y60 w150 h100 vrepeatPoint Choose2, |����������ǰ|���������ǰ|ä��������ǰ|����������ǰ|	 ;

Gui, Add, Text, x20 y100 w100 h20 , �� ���� ;
Gui, Add, ComboBox, x80 y95 w150 h100 vpetEatSel Choose2, |�⺻|�����	 ;
Gui, Add, Text, x250 y100 w100 h20 , �����ռ� ;
Gui, Add, ComboBox, x330 y95 w150 h100 vcrystalSel Choose3, |�ʷϻ�|�Ķ���	 ;

Gui, Add, Text, x20 y135 w100 h20 , ����ܰ� ;
Gui, Add, ComboBox, x80 y130 w50 h100 vsuppressStage Choose1, 2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20	 ;



Gui, Add, text, x20 y180 w60 h50 , ������� : 				;
Gui, Add, text, x90 y180 w40 h50 vA, ����			;
Gui, Add, Button, x350 y180 w40 h20 vButton����, ����				;
Gui, Add, Button, x400 y180 w40 h20 vButton����, ����
Gui, Add, Button, x450 y180 w40 h20 vButton����, ����			;

Gui, Add, ListBox, x20 y210 w450 h100 vl_b

Gui, Add, Text, x160 y220 w160 h20, F2:����  F3:����	 F4:����	;
Gui, Show


;â�̸� �ҷ�����
IniRead OutputVar, %A_ScriptDir%\setting.ini, WindowName, name
GuiControl, , WinNmEdit,  %OutputVar%