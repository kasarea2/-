;~ global RepeatStartCnt := 1
global RepeatEndCnt := 1
global GetItemCnt := 1
global WeightCnt := 1
global petCnt := 1
global blackPixieCnt := 1
global blackPixieYn := "Y"

repeatAll(){
	;~ Weight()
	
	;~ if(RepeatStartCnt >= 36){
		;~ RepeatStart()
		;~ RepeatStartCnt = 0
	;~ }else{
		;~ RepeatStartCnt++
	;~ }
	
	if(RepeatEndCnt >= 3){
		RepeatEnd()
		RepeatEndCnt = 0
	}else{
		RepeatEndCnt++
	}	
	
	if(WeightCnt >= 10){
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
	;~ eat()
	Weight()
	;~ petEatClick()
	;~ Weight()
	;~ skill_up()
	blackPixieYn := "Y"
	blackPixieRequest()
	;~ RepeatStart()
	RepeatEnd()
	
	while(%repeat��ũ�ν���% == true){
		repeatAll() 
		sleep, 3700
	}
}
�����濡�ֱ�(){
	sleep,1500
		
	;~ ������ �ֱ� Ŭ��
	leftClick(815,680,1)
	
	;~ �ƽ�Ŭ��
	sleep,1500
	leftClick(745,558,1)
	
	;~ ������ �ֱ� Ȯ�� Ŭ��
	sleep,1500
	leftClick(740,650,1)
	
	sleep,1500
	leftClick(1230,70,1)
}

;~ ����ǰ ã��
trophySearch(trophy){
	WinGet,processId,ID,%WindowName%
	
	URI1 := % "Image\repeat\" trophy "1.bmp" 
	URI2 := % "Image\repeat\" trophy "2.bmp" 
	URI3 := % "Image\repeat\" trophy "3.bmp" 
	;~ MsgBox, % search_img_GPS(URI1,processId,x,y,100,��������âX1,��������âY1,��������âX2,��������âY2)
	if(search_img_GPS(URI1,processId,x,y,100,��������âX1,��������âY1,��������âX2,��������âY2)){
		;~ MsgBox, %URI1% , %x%, %y%
		leftClick(x,y+20,1)
	}else if(search_img_GPS(URI2,processId,x,y,100,��������âX1,��������âY1,��������âX2,��������âY2)){
		;~ MsgBox, %URI2% , %x%, %y%
		leftClick(x,y+20,1)
	}else if(search_img_GPS(URI3,processId,x,y,100,��������âX1,��������âY1,��������âX2,��������âY2)){
		;~ MsgBox, %URI3% , %x%, %y%
		leftClick(x,y+20,1)
	}else {
		return "N"
	}
	return "Y"
	;~ sleep,5000
}

Weight(){
	WinGet,processId,ID,%WindowName%

	;~ ����ǰ����� �������� ���� ��
	if(repPoint != ""){
		if(search_img_GPS("Image\repeat\�����ִ��ʰ�.bmp",processId,x,y,70,����X1,����Y1,����X2,����Y2)){
			Weight_execute()
		}
	}
}
Weight_execute(){
	WinGet,processId,ID,%WindowName%
	;�� ȣ���ϰ� ���濭��, �ȿ����� ����
	horseOpen := horseCall()
	if(horseOpen =="N"){
		leftClick(440,700,1)
		return 
	}
	;~ �����۰��� > ���� �� Ŭ�� 
	sleep, 1500
	leftClick(1210,240,1)
	
	;~ ������ â �ø���
	sleep, 1000
	loop, 3
	{
		MouseDragClick_Timer(1100,565,1100,290,1000)
		sleep,200
	}
	;~ ������ â �巡�� �Ŀ� ������ ����� �޶���. �ٽ� Ŭ���ؼ� ����
	sleep,1000
	leftClick(1100,565,1)
	sleep,1500
	leftClick(1100,565,1)
	sleep,1500
	
	loopSearchYn := "N"
	
	trophy := repPoint
	loop,4
	{
		;~ ������ ��ġ�� �Ǹ� ����
		loopSearchYn := trophySearch(trophy)
		if(loopSearchYn == "Y"){
			sleep,100
			�����濡�ֱ�()
			break
		}
		sleep,500
	}
	;~ ������ ���������� ã�����ϸ� �ڵ����
	;~ msgbox, %loopSearchYn%
	if(loopSearchYn == "N"){
		;~ �߰߸��ϸ�
		leftClick(1230,70,1)
		sleep,2000
		;~ �ڵ����
		leftClick(440,700,1)
		return
	}
	
	sleep,100
	;~ �߸��� Ŭ������ ������ ���� ������
	if(search_img_GPS("Image\repeat\������.bmp",processId,x,y,70,������X1,������Y1,������X2,������Y2)){
		leftClick(x,y,1)
		return 
	}
	
	;~ ĳ���� ���� �� �� ĳ���� ��ȣ
	;~ MsgBox, �������
	characterNumber := 2
	characterChange(characterNumber)
	
	;~ �� ������ �� ������ Ȯ��
	horseOpen := horseCall()
	if(horseOpen == "N"){		;�� �θ��� ���濭��
		MouseDragClick_Timer(160,560,160,650,1000)
		sleep,1000
		MouseDragClick_Timer(160,560,250,560,1000)
		horseOpen := horseCall()
		if(horseOpen == "N"){
			MouseDragClick_Timer(160,560,160,470,1000)
			sleep,1000
			MouseDragClick_Timer(160,560,70,560,1000)
			horseOpen := horseCall()
		}else {
			horseOpen := "Y"
		}
	}else{
		horseOpen := "Y"
	}
	
	if(horseOpen == "Y"){
		;~ �� ������ ��β�����
		sleep,1000
		leftClick(268,680,1)
		
		;~ �� ������â �ݱ�
		sleep,1000
		leftClick(1230,70,1)
		
		;~ �����޴�Ŭ��
		sleep,1000
		leftClick(50,100,1)
		
		sleep,4000
		loop,10
		{
			if(search_img_GPS("Image\����.bmp",processId,x,y,120,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
				leftClick(x,y,1)
				sleep,1500
				break
			}else if(search_img_GPS("Image\����2.bmp",processId,x,y,120,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
				leftClick(x,y,1)
				sleep,1500
				break
			}else if(search_img_GPS("Image\����3.bmp",processId,x,y,120,����_2X1,����_2Y1,����_2X2,����_2Y2)){
				leftClick(x,y,1)
				sleep,1500
				break
			}	
			sleep,1000
		}
		if(search_img_GPS("Image\����ǰ����.bmp",processId,x,y,100,����ǰ����X1,����ǰ����Y1,����ǰ����X2,����ǰ����Y2)){
			leftClick(x,y,1)
			sleep,1000
			leftClick(1220,70,1)
			sleep,1500
		}
		;~ ������ ĳ���͸� �����. �� ���� ��������
		MouseDragClick_Timer(160,560,160,650,1000)
		sleep,500
		MouseDragClick_Timer(160,560,250,560,1000)
	}
	;~ ĳ�������� ��ɵ���
	crtChangeRepeat()
	sleep,2000
	;~ ������ ������ ��ų��
	Item_Leave()
	sleep,2500
	skill_up()
	sleep,2500
	crystalCompose()
	
	return
}

horseCall(){
	WinGet,processId,ID,%WindowName%
	
	sleep,1000
	;~ �� Ŭ��
	leftClick(45,380,1)
	sleep,6000
	
	;~ ������ Ŭ��
	if(search_img_GPS("Image\repeat\������.bmp",processId,x,y,100,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\repeat\������2.bmp",processId,x,y,100,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\repeat\������3.bmp",processId,x,y,100,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\repeat\������4.bmp",processId,x,y,100,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
	}else{
		;~ MsgBox, end
		return "N"
	}
	
	;~ ������ ���� Ŭ��
	sleep, 1500
	leftClick(1100,700,1)
	sleep,1000
	return "Y"
	
}
characterChange(characterNumber){
	WinGet,processId,ID,%WindowName%
	
	;~ �޴�Ŭ��
	sleep,3000
	leftClick(1230,70,1)
	
	;~ ����Ŭ��
	sleep,1500
	leftClick(1170,585,1)
	
	;~ ĳ���ͺ��� Ŭ��
	sleep,2000
	leftClick(800,660,1)
	
	;~ ĳ���� 2��° �� ����	(������ �ø���.)
	sleep,9000
	if(characterNumber == 1){
		leftClick(1220,85,6)
	}else if(characterNumber == 2){
		leftClick(1220,200,6)
	}
	
	;~ ��������
	sleep,15000
	if(search_img_GPS("Image\repeat\��������.bmp",processId,x,y,80,��������X1,��������Y1,��������X2,��������Y2)){
		leftClick(x,y,1)
		sleep,1500
	}
	
	;~ �⼮����
	if(search_img_GPS("Image\repeat\�⼮����1.bmp",processId,x,y,80,�⼮����X1,�⼮����Y1,�⼮����X2,�⼮����Y2)){
		leftClick(x,y,1)
		sleep,1500
	}else if(search_img_GPS("Image\repeat\�⼮����2.bmp",processId,x,y,80,�⼮����X1,�⼮����Y1,�⼮����X2,�⼮����Y2)){
		leftClick(x,y,1)
		sleep,1500
	}

	;~ �⼮ �����Ҷ� �޼��� �߸� ����
	if(search_img_GPS("Image\repeat\�⼮üũ�̷�Ȯ��.bmp",processId,x,y,100,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
		sleep,2000
	}else if(search_img_GPS("Image\repeat\���ɹ̷�Ȯ��.bmp",processId,x,y,100,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
		sleep,2000
	}
	sleep,2000
}
;~ �����ռ�
crystalCompose(){
	WinGet,processId,ID,%WindowName%
	
	;~ ������Ŭ��
	leftClick(830,710,1)
	
	;~ �����ռ�Ŭ��
	sleep, 1500
	leftClick(1180,330,1)
	
	;~ �ڵ��ռ�Ŭ��
	sleep, 1500
	leftClick(960,700,1)
	
	;~ Ȯ��Ŭ��
	sleep, 1500
	leftClick(730,570,1)
	
	;~ �ڵ��ռ�����
	sleep,12000
	leftClick(475,680,1)
	
	;~ ������
	sleep,2000
	leftClick(1230,70,1)
	sleep,1500
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
			sleep,400
			leftClick(830,570,1)
			sleep,400
			leftClick(660,540,1)
			sleep,800
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
	if(PixieEatLimit != ""){
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
		if(search_img_GPS("Image\�����ɸ���_normal.bmp",processId,x,y,40,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(search_img_GPS("Image\�����ɸ���_magic.bmp",processId,x,y,40,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(search_img_GPS("Image\�����ɸ���_blue.bmp",processId,x,y,40,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 4 && search_img_GPS("Image\item_eat\itemblue_1.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 4 && search_img_GPS("Image\item_eat\itemblue_2.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 3 && search_img_GPS("Image\item_eat\itemgreen_5.bmp",processId,x,y,55,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_1.bmp",processId,x,y,55,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_3.bmp",processId,x,y,55,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 2 && search_img_GPS("Image\item_eat\itemwhite_5.bmp",processId,x,y,55,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_1.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_3.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
			sleep,100
			cnt =% cnt+1
		}else if(LimitIndex >= 1 && search_img_GPS("Image\item_eat\itemgray_5.bmp",processId,x,y,30,�����ɾ�����âX1,�����ɾ�����âY1,�����ɾ�����âX2,�����ɾ�����âY2)){
			leftClick(x,y-10,1)
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
	if(search_img_GPS("Image\�����ɱ������.bmp",processId,x,y,70,�������X1,�������Y1,�������X2,�������Y2)){
		leftClick(x,y,1)
		sleep,500
	}
	if(search_img_GPS("Image\����������_Ȯ��.bmp",processId,x,y,70,����Ȯ��X1,����Ȯ��Y1,����Ȯ��X2,����Ȯ��Y2)){
		leftClick(x,y,1)
		sleep,1000
	}
}
Weight_end(){
	sleep,1000
	;~ RepeatStart()
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
	;~ else{
		;~ MouseDragClick_Timer(160,560,205,470,100)
		;~ sleep,200
	;~ }
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
		;~ RepeatStart()
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
petEatClick(){
	leftClick(620,523,1)
	sleep, 1500
	;~ msgbox, %petEat%
	if(petEat == "�⺻"){
		leftClick(430,611,1)
	}else if(petEat == "�����"){
		leftClick(560,611,1)
	}
	sleep,1500
	
	return petEatCheck()
	
}
;~ ����̰� �ִ��� üũ
petEatCheck(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\repeat\����̾˸�1.bmp",processId,x,y,90,����̾˸�X1,����̾˸�Y1,����̾˸�X2,����̾˸�Y2)){
		return "N"
	}else if(search_img_GPS("Image\repeat\����̾˸�2.bmp",processId,x,y,90,����̾˸�X1,����̾˸�Y1,����̾˸�X2,����̾˸�Y2)){
		return "N"
	}
	return "Y"
}
pet(){
	if(petEat != ""){
		eatCheck := "Y" 
		sleep,2000
		;~ ù���� �� ���� ���̱�
		leftClick(110,380,1)
		sleep, 2500
		eatCheck := petEatClick()
		
		if(eatCheck == "Y"){
			;~ �ι��� �� ���� ���̱�
			leftClick(900,380,1)
			sleep, 1500
			eatCheck := petEatClick()
		}
		if(eatCheck == "Y"){
			;~ ������ �� ���� ���̱�
			leftClick(900,500,1)
			sleep, 1500
			eatCheck := petEatClick()
		}
		;~ ���̰� ������ �ݷ����� â�� �ݰ� ĳ���� �������� ���̸� �緯 ������.
		if(eatCheck == "N"){
			petEatFurchase()
		}else{
			;~ �� ���� ��������
			leftClick(1230,70,1)
		}
	}
}
;~ ����� ����
petEatFurchase(){
	WinGet,processId,ID,%WindowName%
	
	leftClick(1230,70,1)
		
	characterNumber := 2
	characterChange(characterNumber)
	
	leftClick(270,210,1)
	
	sleep,1000
	;~ ����ο��� �̵�
	if(search_img_GPS("Image\repeat\����θ�ũ.bmp",processId,x,y,50,���θ���ƮX1,���θ���ƮY1,���θ���ƮX2,���θ���ƮY2)){
		leftClick(x,y,1)
	}else{
		leftClick(320,165,1)
	}
	;~ ���θ�����
	sleep,2000
	leftClick(550,360,1)
	
	;~ �̵����
	sleep,23000
	;~ �����Ŭ��
	if(search_img_GPS("Image\repeat\�����.bmp",processId,x,y,85,�ൿX1,�ൿY1,�ൿX2,�ൿY2)){
		leftClick(x,y,1)
	}else{
		;~ ĳ������ �� ��� ����
		crtChangeRepeat()
		return 
	}
	;~ ���Ŭ��
	sleep, 2000
	leftClick(100,270,1)
	;~ ��� +100��,+50��Ŭ�� �� Ȯ��, ���� Ŭ��, â����
	sleep, 1200
	leftClick(750,500,1)
	sleep, 1000
	leftClick(750,420,1)
	sleep, 1000
	leftClick(750,620,1)
	sleep, 1500
	leftClick(750,620,1)
	sleep,1500
	leftClick(1230,70,1)
		
	;~ ����Ŭ��
	sleep, 1500
	leftClick(50,100,1)
	
	sleep, 25000
	;~ ������ ĳ���͸� �����. �� ���� ��������
	MouseDragClick_Timer(160,560,160,650,1000)
	sleep,500
	MouseDragClick_Timer(160,560,250,560,1000)
	
	;~ ������ ã��
	horseOpen := horseCall()
	if(horseOpen == "N"){
		MouseDragClick_Timer(160,560,160,650,1000)
		sleep,500
		MouseDragClick_Timer(160,560,250,560,1000)
		horseOpen := horseCall()
	}
	;~ ������ ã�����ϸ� �ڵ���� ����
	if(horseOpen == "N"){
		crtChangeRepeat()
		return 
	}
	;~ �Ҹ�ǰ â Ŭ��
	sleep,1000
	leftClick(1210,240,1)
	
	
	;~ ����̵�, �ƽ�, Ȯ�� Ŭ��, ����
	sleep,1500
	if(search_img_GPS("Image\repeat\����.bmp",processId,x,y,90,��������âX1,��������âY1,��������âX2,��������âY2)){
		leftClick(1150,690,1)
		sleep,1000
		leftClick(x,y,1)
		sleep, 1500
		leftClick(750,550,1)
		sleep, 1000
		leftClick(750,620,1)
		sleep, 1000
		leftClick(1230,70,1)
		
		;~ ĳ���� ����
		characterNumber := 1
		characterChange(characterNumber)
		
		;~ ������ ã�� �� ���� ���ѹݺ�
		horseOpen := "N"
		while(horseOpen == "N"){
			sleep, 500
			horseOpen := horseCall()
			;~ ������ã���� ��Შ���� �ڵ���� �� ����
			if(horseOpen == "Y"){
				sleep, 1000
				leftClick(230,670,1)
				
				sleep, 1000
				leftClick(1230,70,1)
				
				sleep, 2000
				leftClick(440,700,1)
				sleep, 1500
				return 
			}
			MouseDragClick_Timer(160,560,205,470,100)
		}
	}else{
		leftClick(1230,70,1)
		crtChangeRepeat()
		return 
	}
	
}
;~ ĳ�� ���� �� ��ɵ��� �Լ�
crtChangeRepeat(){
	characterNumber := 1
	characterChange(characterNumber)
	
	;~ �ڵ����
	leftClick(440,700,1)
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