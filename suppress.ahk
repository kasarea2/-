;~ 토벌의뢰 ahk
global NextStageCheckCnt := 1
global CharacterStopCheckCnt := 1
토벌시작(){
	;~ 토벌입장
	토벌입장()
	NextStageCheck()

	while(%토벌매크로시작% == true){
		;~ 토벌의뢰 다음단계 체크
		if(NextStageCheckCnt >= 30){
			NextStageCheck()
			NextStageCheckCnt = 0
		}else{
			NextStageCheckCnt++
		}
		if(CharacterStopCheckCnt >= 60){
			MouseDragClick_Timer(160,560,205,470,300)
			CharacterStopCheckCnt = 0
		}else{
			CharacterStopCheckCnt++
		}
		
		sleep, 1000
	}

}

;~ 토벌의뢰 다음단계 체크 함수
NextStageCheck(){
	WinGet,processId,ID,%WindowName%
	
	;~ 임무성공시 확인버튼
	if(search_img_GPS("Image\토벌\토벌완료확인.bmp",processId,x,y,50,토벌완료확인X1,토벌완료확인Y1,토벌완료확인X2,토벌완료확인Y2)){
		sleep, 400
		;~ 다음단계 체크
		if(search_img_GPS("Image\토벌\2단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,2)
		}else if(search_img_GPS("Image\토벌\3단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,3)
		}else if(search_img_GPS("Image\토벌\4단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,4)
		}else if(search_img_GPS("Image\토벌\5단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,5)
		}else if(search_img_GPS("Image\토벌\6단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,6)
		}else if(search_img_GPS("Image\토벌\7단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,7)
		}else if(search_img_GPS("Image\토벌\8단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,8)
		}else if(search_img_GPS("Image\토벌\9단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,9)
		}else if(search_img_GPS("Image\토벌\10단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,10)
		}else if(search_img_GPS("Image\토벌\11단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,11)
		}else if(search_img_GPS("Image\토벌\12단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,12)
		}else if(search_img_GPS("Image\토벌\13단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,13)
		}else if(search_img_GPS("Image\토벌\14단계.bmp",processId,x,y,50,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
			NextClick(x,y,14)
		}else{
			NextClick(650,660,999)
		}
	}
	;~ else if(search_img_GPS("Image\토벌\15단계.bmp",processId,x,y,100,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
		;~ NextClick(x,y,15)
	;~ }else if(search_img_GPS("Image\토벌\16단계.bmp",processId,x,y,100,토벌다음단계X1,토벌다음단계Y1,토벌다음단계X2,토벌다음단계Y2)){
		;~ NextClick(x,y,16)
	;~ }
}
;~ 다음 스테이지를 클릭할지 안할지를 정함. 설정한 스테이지보다 높으면 중지
NextClick(x,y,NextStageNum){
	if(SelectStageNum >= NextStageNum){
		;~ msgbox, 다음확인
		leftClick(x,y,1)
	}else{
		;~ msgbox, 종료확인
		leftClick(650,660,1)
		토벌매크로시작 = false
		return
	}
	sleep, 17000
	;~ 자동사냥클릭
	leftClick(442,700,1)
}

토벌입장(){
	WinGet,processId,ID,%WindowName%
	
	;~ 토벌입장확인
	if(search_img_GPS("Image\토벌\토벌입장.bmp",processId,x,y,50,토벌입장X1,토벌입장Y1,토벌입장X2,토벌입장Y2)){
		
	sleep,10000
		leftCLick(x,y,1)
		sleep, 17000
		;~ 자동사냥클릭
		leftClick(442,700,1)
	}
}