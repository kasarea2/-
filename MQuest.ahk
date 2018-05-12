

global mainQuestCnt := 0
global tutorialCnt := 0
global questActionCnt := 0
global dialogueNextCnt := 0
global questSuccessCnt := 0

return

메인퀘(){

	;~ Item_Leave()
	;~ Weight_main()
	;~ eat()
	quest_success()
	quest_accept()
	tutorial()
	action()
	dialogueNext()
	
	quest_success()
	;~ MsgBox, %main매크로시작%
	while(%main매크로시작% == true){
		if(mainQuestCnt >= 8){
			quest_accept()
			mainQuestCnt = 0
		}else{
			mainQuestCnt++
		}
		
		if(tutorialCnt >= 9){
			tutorial()
			tutorialCnt = 0
		}else{
			tutorialCnt++
		}
		
		if(questActionCnt >= 9){
			action()
			questActionCnt = 0
		}else{
			questActionCnt++
		}
		
		if(dialogueNextCnt >= 6){
			dialogueNext()
			dialogueNextCnt = 0
		}else{
			dialogueNextCnt++
		}
		if(questSuccessCnt >= 9){
			quest_success()
			Weight_main()
			questSuccessCnt = 0 
		}else{
			questSuccessCnt++
		}
		sleep, 2000
	}
}
던전성공체크(){
	WinGet,processId,ID,%WindowName%
	;~ 임무시작 후 임무 종료시기 캐치
	임무시작breakcnt := 0
	while(%임무시작breakcnt% <60){
		sleep,10000
		if(search_img_GPS("Image\main_quest\던전임무성공.bmp",processId,x,y,120,임무성공X1,임무성공Y1,임무성공X2,임무성공Y2)){
			leftClick(x,y,1)
			break
		}
		MouseDragClick_Timer(160,560,205,470,200)
		임무시작breakcnt++
	}
	;~ 던전 끝나고 로딩
	sleep, 10000
}
quest_success(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\main_quest\의뢰완료1.bmp",processId,x,y,80,임무성공X1,임무성공Y1,임무성공X2,임무성공Y2)){
		leftClick(x,y,1)
		getCat()
	}else if(search_img_GPS("Image\main_quest\의뢰완료2.bmp",processId,x,y,80,임무성공X1,임무성공Y1,임무성공X2,임무성공Y2)){
		leftClick(x,y,1)
		getCat()
	}else if(search_img_GPS("Image\main_quest\의뢰완료3.bmp",processId,x,y,80,임무성공X1,임무성공Y1,임무성공X2,임무성공Y2)){
		leftClick(x,y,1)
		getCat()
	}else if(search_img_GPS("Image\main_quest\임무시작.bmp",processId,x,y,60,임무시작X1,임무시작Y1,임무시작X2,임무시작Y2)){
		leftClick(x,y,1)
		sleep, 20000
		loop,6{
			leftClick(970,200,1)
			sleep,1000
		}
		던전성공체크()
	}else if(search_img_GPS("Image\main_quest\임무성공.bmp",processId,x,y,80,던전사망X1,던전사망Y1,던전사망X2,던전사망Y2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\던전사망_다시도전.bmp",processId,x,y,80,임무성공X1,임무성공Y1,임무성공X2,임무성공Y2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\평가닫기.bmp",processId,x,y,60,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\메인의뢰_자동.bmp",processId,x,y,90,행동X1,행동Y1,행동X2,행동Y2)){
		leftClick(730,610,1)
	}else if(search_img_GPS("Image\main_quest\자동사냥진입마크.bmp",processId,x,y,60,자동사냥진입X1,자동사냥진입Y1,자동사냥진입X2,자동사냥진입Y2)){
		;~ 자동사냥진입
		leftClick(490,600,1)
		sleep,1500
		leftClick(730,610,1)
		sleep,2000
		leftClick(640,300,1)
		;~ 자동사냥 퀘스트 앞으로 클릭
		sleep,4000
		leftClick(500,430,1)
		sleep, 40000
		if(search_img_GPS("Image\main_quest\작동.bmp",processId,x,y,90,행동X1,행동Y1,행동X2,행동Y2)){
			leftClick(x,y,1)
			sleep, 1000
			leftClick(x,y,1)
			sleep, 1000
			leftClick(x,y,1)
			sleep, 1000
			leftClick(600,610,1)
			sleep, 1000
			leftClick(x,y,1)
			sleep, 1000
			leftClick(x,y,1)
			sleep, 1000
			leftClick(x,y,1)
			sleep,500
			if(search_img_GPS("Image\main_quest\반복의뢰수락.bmp",processId,x,y,70,반복의뢰수락X1,반복의뢰수락Y1,반복의뢰수락X2,반복의뢰수락Y2)){
				leftClick(x,y,1)
				main매크로시작 = false
				if(search_img_GPS("Image\반복퀘스트.bmp",processId,x,y,80,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
					leftClick(x,y,1)
					sleep,500
					leftClick(x-30,y,2)
				}
				자동사냥시작()
			}
		}
	}else if(search_img_GPS("Image\main_quest\광원석탭.bmp",processId,x,y,80,광원석탭X1,광원석탭Y1,광원석탭X2,광원석탭Y2)){
		leftClick(x,y,1)
		sleep, 2000
		leftClick(1150,700,1)
		sleep, 1000
		leftClick(1230,70,1)
		sleep, 500
	}else if(search_img_GPS("Image\main_quest\메인던전시작.bmp",processId,x,y,60,메인던전시작X1 ,메인던전시작Y1,메인던전시작X2,메인던전시작Y2)){
		leftClick(x,y,1)
	;~ else if(search_img_GPS("Image\main_quest\반복의뢰찾아가기.bmp",processId,x,y,120,반복의뢰찾아가기X1,반복의뢰찾아가기Y1,반복의뢰찾아가기X2,반복의뢰찾아가기Y2)){
	;~ MsgBox, 2
		sleep, 20000
		;~ 퀘스트 클릭으로 자동시작
		loop,6
		{
			leftClick(970,210,1)
			sleep,1000
		}
		던전성공체크()
		
		;~ leftClick(x,y,1)
		
	}
}
dialogueNext(){
	WinGet,processId,ID,%WindowName%
	whileCnt := 0
	if(search_img_GPS("Image\main_quest\선택받기.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		의뢰완료_select(x,y)
	}
}
dialogue_Click(x,y){
	leftClick(x,y,1)
}
quest_accept(){
	WinGet,processId,ID,%WindowName%
	if(search_img_GPS("Image\main_quest\이동.bmp",processId,x,y,80,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
		;~ MsgBox,%x%,%y%
		MainQuest_sub(x,y)
	}else if(search_img_GPS("Image\main_quest\도움손길.bmp",processId,x,y,90,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
		;~ MsgBox,3
		MainQuest_sub(x,y)
	}else if(search_img_GPS("Image\main_quest\대화.bmp",processId,x,y,70,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
		;~ MsgBox,4
		MainQuest_sub(x,y)
	}else if(search_img_GPS("Image\main_quest\낚시퀘.bmp",processId,x,y,90,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
		;~ MsgBox,4
		fishingClick(1165,630)
	}else if(search_img_GPS("Image\main_quest\사용퀘스트.bmp",processId,x,y,80,퀘스트X1,퀘스트Y1,퀘스트X2,퀘스트Y2)){
		;~ MsgBox,5
		MainQuest_sub(x,y)
		sleep,400
		if(search_img_GPS("Image\main_quest\1렙물약사용퀘.bmp",processId,x,y,80,물약X1,물약Y1 ,물약X2 ,물약Y2 )){
			;~ MsgBox,6
			leftClick(x,y,2)
		}
	}else if(search_img_GPS("Image\main_quest\자동사냥.bmp",processId,x,y,120,자동사냥이미지X1,자동사냥이미지Y1,자동사냥이미지X2,자동사냥이미지Y2)){
		;~ MsgBox,8
		leftClick(x,y,1)
	}else{
		;~ msgbox,7
		leftClick(1230,200,1)
		sleep, 500
		leftClick(1190,200,1)
		sleep,500
		leftClick(1230,200,1)
		sleep, 500
		leftClick(1190,200,1)
		sleep, 500
		leftClick(1130,200,1)
		sleep, 500
	}
}

action(){
	WinGet,processId,ID,%WindowName%
	MouseDragClick(560,630,800,645)
	if(search_img_GPS("Image\main_quest\제작.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 2
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\놓기.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 3
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\놓기2.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 4
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돋보기.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 6
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돋보기2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 7
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돋보기3.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 8
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돋보기4.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 9
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돋보기5.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 10
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돋보기6.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 11
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돋보기7.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 12
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\곡괭이1.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 34
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\곡괭이2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 35
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\곡괭이3.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 36
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\곡괭이4.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 37
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\곡괭이5.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 38
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\호미2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 13
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\호미3.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 14
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\호미4.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 15
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\호미5.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 16
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\호미6.bmp",processId,x,y,110,퀘스트행동영역X1,퀘스트행동영역Y1,퀘스트행동영역X2,퀘스트행동영역Y2)){
		;~ MsgBox, 17
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\벌목.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 18
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\벌목2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 19
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\제작.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 20
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\제작2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 21
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\제작3.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 22
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돕기.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 23
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돕기2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 24
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\돕기3.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 25
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\톱니.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 26
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\톱니2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 27
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\톱니3.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 28
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\톱니4.bmp",processId,x,y,110,퀘스트행동영역X1,퀘스트행동영역Y1,퀘스트행동영역X2,퀘스트행동영역Y2)){
		;~ MsgBox, 29
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\채광.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 30
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\뿌리기.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 31
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\뿌리기2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 32
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\뿌리기3.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 33
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\쓰다듬기1.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 39
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\쓰다듬기2.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 40
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\열쇠.bmp",processId,x,y,120,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 41
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\열쇠2.bmp",processId,x,y,120,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 42
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\열쇠3.bmp",processId,x,y,120,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 43
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\열쇠4.bmp",processId,x,y,120,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 44
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\취소.bmp",processId,x,y,60,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 45
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\부수기.bmp",processId,x,y,120,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 46
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\부수기2.bmp",processId,x,y,120,행동X1,행동Y1,행동X2,행동Y2)){
		;~ MsgBox, 47
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\물뜨기1.bmp",processId,x,y,110,퀘스트행동영역X1,퀘스트행동영역Y1,퀘스트행동영역X2,퀘스트행동영역Y2)){
		;~ MsgBox, 5
		leftClick(x,y,1)
	}else if(search_img_GPS("Image\main_quest\수정장착.bmp",processId,x,y,100,수정장착X1,수정장착Y1,수정장착X2,수정장착Y2)){
		;~ MsgBox, 48
		leftClick(710,200,1)
		sleep,1000
		leftClick(920,180,1)
		sleep,1000
		leftClick(700,550,1)
		sleep,1000
		leftClick(1230,70,1)
	}else{
		;~ MsgBox,왜
		return 
	}
		;~ MsgBox,왜2
		sleep,4000
}
getCat(){
	WinGet,processId,ID,%WindowName%
	sleep,1000
	if(Search_img("Image\main_quest\고양이선택.bmp",processId,x,y,80)){
		의뢰완료_select(x,y)
	}else if(search_img_GPS("Image\main_quest\중급블랙스톤.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		의뢰완료_select(x,y)
	}else if(search_img_GPS("Image\main_quest\중급블랙스톤.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		의뢰완료_select(x,y)
	}else if(search_img_GPS("Image\main_quest\바레스반지.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		의뢰완료_select(x,y)
	}else if(search_img_GPS("Image\main_quest\바레스목걸이.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		의뢰완료_select(x,y)
	}else if(search_img_GPS("Image\main_quest\선택받기.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
		의뢰완료_select(x,y)
	}else{
		의뢰완료_select(720,500)
	}
}
의뢰완료_select(x,y){
	leftClick(x,y,1)
	sleep, 1500
	leftClick(1100,y,1)
	sleep, 1000
	leftClick(700,730,1)
	sleep, 1000
	leftClick(700,730,1)
	sleep,500
}
tutorial(){
	WinGet,processId,ID,%WindowName%
	;~ tutorialCheck := false
	;~ if(Search_img("Image\main_quest\튜토리얼1.bmp",processId,x,y,120)){
		;~ tutorialCheck = true
	;~ }else if(Search_img("Image\main_quest\튜토리얼2.bmp",processId,x,y,120)){
		;~ tutorialCheck = true
	;~ }
	
	sleep,300
	;~ if(%tutorialCheck% == true){
		if(search_img_GPS("Image\main_quest\튜토리얼취소.bmp",processId,x,y,100,튜토리얼취소X1,튜토리얼취소Y1,튜토리얼취소X2,튜토리얼취소Y2)){
			;~ MsgBox,%x%, %y%
			leftClick(x,y,1)
		}
	;~ }
}
mainQuest_sub(x,y){
	sleep,100
	leftClick(x,y,1)
	sleep,600
	leftClick(x-25,y,1)
}
Weight_main(){
	WinGet,processId,ID,%WindowName%
	
	if(search_img_GPS("Image\무게초과.bmp",processId,x,y,100,무게X1,무게Y1,무게X2,무게Y2)){
		leftClick(x,y,1)
		sleep,1500
		if(search_img_GPS("Image\무게_마을이동.bmp",processId,x,y,100,무게마을이동X1,무게마을이동Y1,무게마을이동X2,무게마을이동Y2)){
			leftClick(x,y,1)
			sleep,2000
		}
		sleep,45000
		leftClick(1100,75,1)
		sleep,2000
		;~ leftClick(750,710,1)
		;~ sleep,1000
		leftClick(1230,75,1)
		sleep,2000
		if(search_img_GPS("Image\상점.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
			;~ msgbox, 1
			leftClick(x,y,1)
			sleep,500
		}else if(search_img_GPS("Image\상점2.bmp",processId,x,y,100,행동X1,행동Y1,행동X2,행동Y2)){
			;~ msgbox, 2
			leftClick(x,y,1)
			sleep,500
		}else if(search_img_GPS("Image\상점3.bmp",processId,x,y,100,상점_2X1,상점_2Y1,상점_2X2,상점_2Y2)){
			leftClick(x,y,1)
			sleep,1300
		}	
		if(search_img_GPS("Image\전리품정리.bmp",processId,x,y,100,전리품정리X1,전리품정리Y1,전리품정리X2,전리품정리Y2)){
			leftClick(x,y,1)
			sleep,1000
			leftClick(1220,70,1)
			sleep,1000
			end = true
			Item_Leave()
			skill_up()
		}
	}
	
}