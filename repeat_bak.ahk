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
�ڵ���ɽ���(){
	WinGet,processId,ID,%WindowName%
	;~ skill_up()
	blackPixieYn := "N"
	blackPixieRequest()
	RepeatStart()
	RepeatEnd()
	Weight()
	
	while(%repeat��ũ�ν���% == true){
		repeatAll() 
		sleep, 3700
	}
}
Weight(){
	WinGet,processId,ID,%WindowName%
	end := false
	if(search_img_GPS("Image\�����ʰ�.bmp",processId,x,y,100,����X1,����Y1,����X2,����Y2)){
		leftClick(x,y,1)
		sleep,1500
	}
	if(search_img_GPS("Image\����_�����̵�.bmp",processId,x,y,100,���Ը����̵�X1,���Ը����̵�Y1,���Ը����̵�X2,���Ը����̵�Y2)){
		leftClick(x,y,1)
		sleep,46000
	}
	if(search_img_GPS("Image\����.bmp",processId,x,y,100,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
		sleep,1300
	}else if(search_img_GPS("Image\����2.bmp",processId,x,y,100,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
		sleep,1300
	}else if(search_img_GPS("Image\����3.bmp",processId,x,y,100,����_2X1,����_2Y1,����_2X2,����_2Y2)){
		leftClick(x,y,1)
		sleep,1300
	}	
	if(search_img_GPS("Image\����ǰ����.bmp",processId,x,y,100,����ǰ����X1,����ǰ����Y1,����ǰ����X2,����ǰ����Y2)){
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
;~ ��ų ��
skill_up(){
	leftClick(1030,70,1)
	sleep, 2000
	
	cnt := 0
	loop,5
	{
		Y��ǥ := 270
		loop,3
		{
			leftClick(1140,Y��ǥ,1)
			sleep,700
			leftClick(830,570,1)
			sleep,700
			leftClick(660,540,1)
			sleep,1000
			Y��ǥ = % Y��ǥ + 110
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
	
	;~ ������ ��� ���� ����
	if(PixieEatLimit == "ȸ��"){
		LimitIndex = 1
	}else if(PixieEatLimit == "�Ͼ��"){
		LimitIndex = 2
	}else if(PixieEatLimit == "�ʷϻ�"){
		LimitIndex = 3
	}else if(PixieEatLimit == "�Ķ���"){
		LimitIndex = 4
	}else if(PixieEatLimit == "�����"){
		LimitIndex = 5
	}else if(PixieEatLimit == "�����"){
		LimitIndex = 6
	}
	
	;~ MsgBox, %LimitIndex%
	while(1){
		if(search_img_GPS("Image\�����ɸ���_normal.bmp",processId,x,y,90,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(search_img_GPS("Image\�����ɸ���_magic.bmp",processId,x,y,90,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(search_img_GPS("Image\�����ɸ���_blue.bmp",processId,x,y,90,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 4 && search_img_GPS("Image\item_eat\itemblue_1.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 4 && search_img_GPS("Image\item_eat\itemblue_2.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 3 && search_img_GPS("Image\item_eat\itemgreen_5.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_1.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_3.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_5.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_1.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_3.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_5.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
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
	if(search_img_GPS("Image\�����ɱ�����.bmp",processId,x,y,70,������X1,������Y1,������X2,������Y2)){
		leftClick(x,y,1)
		sleep,500
	}
	if(search_img_GPS("Image\���������_Ȯ��.bmp",processId,x,y,70,���Ȯ��X1,���Ȯ��Y1,���Ȯ��X2,���Ȯ��Y2)){
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
	
	if(search_img_GPS("Image\�����ۻ���_GIB.bmp",processId,x,y,150,�����ۻ���X1,�����ۻ���Y1,�����ۻ���X2,�����ۻ���Y2)){
		leftClick(x,y,2)
		sleep,500
	}else if(search_img_GPS("Image\�����ۻ���_small.bmp",processId,x,y,150,�����ۻ���X1,�����ۻ���Y1,�����ۻ���X2,�����ۻ���Y2)){
		leftClick(x,y,2)
		sleep,500
	}else if(search_img_GPS("Image\�����ۻ���_small2.bmp",processId,x,y,150,�����ۻ���X1,�����ۻ���Y1,�����ۻ���X2,�����ۻ���Y2)){
		leftClick(x,y,2)
		sleep,500
	}
}
RepeatStart(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\�ݺ�����Ʈ.bmp",processId,x,y,90,����ƮX1,����ƮY1,����ƮX2,����ƮY2)){
		;~ MsgBox, 2
		leftClick(x,y,1)
		sleep,500
		leftClick(x-50,y,2)
		sleep,6000
	}
	;~ else if(search_img_GPS("Image\�ݺ�����Ʈ3.bmp",processId,x,y,90,����ƮX1,����ƮY1,����ƮX2,����ƮY2)){
		;~ MsgBox, 2
		;~ leftClick(x,y,1)
		;~ sleep,500
		;~ leftClick(x-50,y,2)
		;~ sleep,6000
	;~ }else if(search_img_GPS("Image\�ݺ�����Ʈ2.bmp",processId,x,y,90,����ƮX1,����ƮY1,����ƮX2,����ƮY2)){
		;~ MsgBox, 2
		;~ leftClick(x,y,1)
		;~ sleep,500
		;~ leftClick(x-50,y,2)
		;~ sleep,6000
	;~ }
}

RepeatEnd(){
	WinGet,processId,ID,%WindowName%
	
	if(search_img_GPS("Image\�ݺ��Ϸ�1.bmp",processId,x,y,100,�Ϸ�X1,�Ϸ�Y1,�Ϸ�X2,�Ϸ�Y2)){
		;~ MsgBox, a5
		RepeatEnd_sub(x,y)
	}else if(search_img_GPS("Image\�ݺ��Ϸ�2.bmp",processId,x,y,100,�Ϸ�X1,�Ϸ�Y1,�Ϸ�X2,�Ϸ�Y2)){
		;~ MsgBox, a4
		RepeatEnd_sub(x,y)
	}else if(search_img_GPS("Image\�ݺ��Ϸ�3.bmp",processId,x,y,100,�Ϸ�X1,�Ϸ�Y1,�Ϸ�X2,�Ϸ�Y2)){
		;~ MsgBox, a3
		RepeatEnd_sub(x,y)
	}else if(search_img_GPS("Image\�ݺ��Ϸ�4.bmp",processId,x,y,100,�Ϸ�X1,�Ϸ�Y1,�Ϸ�X2,�Ϸ�Y2)){
		;~ MsgBox, as2
		RepeatEnd_sub(x,y)
	}else if(search_img_GPS("Image\�ݺ��Ϸ�5.bmp",processId,x,y,100,�Ϸ�X1,�Ϸ�Y1,�Ϸ�X2,�Ϸ�Y2)){
		;~ MsgBox, a1
		RepeatEnd_sub(x,y)
	}
	loop,2
	{
		if(search_img("Image\�ݺ��ٽùޱ�.bmp",processId,x,y,60)){
			leftClick(x,y,1)
			sleep,500
			next = 2
			break
		}
	}
	if(search_img("Image\�ݺ�����.bmp",processId,x,y,60)){
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
	;~ ù���� �� ���� ���̱�
	leftClick(110,380,1)
	sleep, 2500
	leftClick(620,523,1)
	sleep, 1500
	leftClick(560,665,1)
	sleep, 1500
	
	;~ �ι��� �� ���� ���̱�
	leftClick(900,380,1)
	sleep, 1500
	leftClick(620,523,1)
	sleep, 1500
	leftClick(560,665,1)
	sleep, 1500
	
	;~ ������ �� ���� ���̱�
	leftClick(900,500,1)
	sleep, 1500
	leftClick(620,523,1)
	sleep, 1500
	leftClick(560,665,1)
	sleep, 1500
	
	;~ �� ���� ��
	leftClick(1230,70,1)
}


blackPixieRequest(){
	WinGet,processId,ID,%WindowName%

	sleep,2000
	
	;~ ������ Ŭ��
	leftClick(830,700,1)
	sleep,1500
	
	;~ �������Ƿ� ����
	leftClick(1190,640,1)
	sleep, 1000
	
	;~ ������ �Ƿ�â���� Ȯ��
	if(search_img_GPS("Image\�������Ƿ�_������.bmp",processId,x,y,90,�������Ƿ�_������X1,�������Ƿ�_������Y1,�������Ƿ�_������X2,�������Ƿ�_������Y2)){
		sleep,500
		if(search_img_GPS("Image\�����ɼ���.bmp",processId,x,y,50,����������ƮX1,����������ƮY1,����������ƮX2,����������ƮY2)){
			leftClick(x,y,1)
			sleep,1000
			;~ ������ư Ŭ��
			loop,8
			{
				leftClick(710,610,1)
				sleep,1500
			}
		}else{
			if(search_img_GPS("Image\�����ɼ����Ұ�.bmp",processId,x,y,70,����������ƮX1,����������ƮY1,����������ƮX2,����������ƮY2)){
				;~ �Ƿ� �������̸� â ����
			}else{
				;~ ������ ����Ʈ�� ������ �������� ��������
				blackPixieYn := "N"
			}
		}
		;~ ������ �Ƿ�â ����
		leftClick(1230,70,1)
		;~ msgbox, %blackPixieYn%
	}
	return
}
