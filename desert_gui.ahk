Gui, Add, Text, x0 y0 w70 h20,			;
;~ Gui, Add, text, x500 y200 w480 h20, 검은사막 매크로	;
;~ Gui, Add, text, x60 y50 w20 h50 vB, 0회				;

;~ Gui, Add, Edit, x80 y80 w30 h20 v반복횟수,0		;
;~ Gui, Add, Text, x115 y84 w20 h20, 회				;
;~ GUi, Add, CheckBox, x20 y110 w100 h20 v2번이미지클릭 checked, 2번이미지클릭	;
Gui, Add, Text, x30 x20 w70 h20, *시작위치			;
Gui, Add, ComboBox, x80 y20 w150 h100 vStartGPS Choose1, 자동사냥|메인퀘|크자카|낚시|토벌	 ;
Gui, Add, Text, x250 y25 w80 h20, *프로세스 명  ;
Gui, Add, Edit, x330 y20 w120 h20 vWinNmEdit,		;

;~ Gui, Add, Text, x20 y65 w70 h20, 서버 선택 		;
;~ Gui, Add, ComboBox, x80 y60 w150 h100 vStartServer Choose1,  하이델|칼페온|애화저 	 ;
Gui, Add, Text, x20 y65 w100 h20, 장비 제물 ;
Gui, Add, ComboBox, x80 y60 w150 h100 vblackPixieEat Choose5, |회색|하얀색|초록색|파란색|보라색|노란색	 ;
Gui, Add, Text, x250 y65 w100 h20 , 전리품목록 ;
Gui, Add, ComboBox, x330 y60 w150 h100 vrepeatPoint Choose2, |만샤족전리품|샤우닐전리품|채석장전리품|루툼족전리품|	 ;

Gui, Add, Text, x20 y100 w100 h20 , 펫 먹이 ;
Gui, Add, ComboBox, x80 y95 w150 h100 vpetEatSel Choose2, |기본|영양식	 ;
Gui, Add, Text, x250 y100 w100 h20 , 수정합성 ;
Gui, Add, ComboBox, x330 y95 w150 h100 vcrystalSel Choose3, |초록색|파란색	 ;

Gui, Add, Text, x20 y135 w100 h20 , 토벌단계 ;
Gui, Add, ComboBox, x80 y130 w50 h100 vsuppressStage Choose1, 2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20	 ;



Gui, Add, text, x20 y180 w60 h50 , 현재상태 : 				;
Gui, Add, text, x90 y180 w40 h50 vA, 멈춤			;
Gui, Add, Button, x350 y180 w40 h20 vButton시작, 시작				;
Gui, Add, Button, x400 y180 w40 h20 vButton멈춤, 멈춤
Gui, Add, Button, x450 y180 w40 h20 vButton종료, 종료			;

Gui, Add, ListBox, x20 y210 w450 h100 vl_b

Gui, Add, Text, x160 y220 w160 h20, F2:시작  F3:멈춤	 F4:종료	;
Gui, Show


;창이름 불러오기
IniRead OutputVar, %A_ScriptDir%\setting.ini, WindowName, name
GuiControl, , WinNmEdit,  %OutputVar%