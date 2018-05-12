크자카(repeatYn){
	WinGet,processId,ID,%WindowName%
	크자카이동(50000,repeatYn)
	cnt := 0
	while(%크자카매크로시작% == true){
		if(search_img_GPS("Image\크자카\크자카입구.bmp",processId,x,y,110,행동X1,행동Y1,행동X2,행동Y2)){
			leftClick(x,y,1)
			
			;~ 출정 클릭
			sleep,1500
			leftClick(640,615,1)
			
			;~ 자동사냥클릭
			sleep,15000
			leftClick(450,700,1)
			sleep,100
			break
		}
		
		if(cnt++ > 50){
			cnt = 0
			크자카이동(5000,"N")
			sleep,1000
		}
	}
	
	while(%크자카매크로시작% == true){
		if(search_img_GPS("Image\크자카\사망.bmp",processId,x,y,60,행동X1,행동Y1,행동X2,행동Y2)){
			leftClick(x,y,1)
			
			;~ 자동사냥클릭
			sleep, 4000
			leftClick(450,700,1)
		}else if(repeatYn=="Y"){
			if(search_img_GPS("Image\크자카\크자카 완료.bmp",processId,x,y,80,크자카완료X1,크자카완료Y1,크자카완료X2,크자카완료Y2)){
				leftClick(x,y,1)
				sleep,14000
				break
			}
		}
		
		sleep,1500
	}
}
return

크자카이동(traveltime,repeatYn){
	WinGet,processId,ID,%WindowName%
	
	;~ 크자카 이동 이미지 클릭
	sleep,200
	if(repeatYn == "N"){
		if(search_img_GPS("Image\크자카\크자카이미지.bmp",processId,x,y,100,크자카이미지X1,크자카이미지Y1,크자카이미지X2,크자카이미지Y2)){
			leftClick(x,y,1)
		}else if(search_img_GPS("Image\크자카\크자카이미지2.bmp",processId,x,y,100,크자카이미지X1,크자카이미지Y1,크자카이미지X2,크자카이미지Y2)){
			leftClick(x,y,1)
		}
	
		;~ 출정 클릭
		sleep,1500
		leftClick(640,615,1)
	}
	;~ 출정확인
	sleep,1000
	leftClick(740,540,1)
	
	;~ 크자카 던전 입구 이동
	sleep, %traveltime%
	MouseDragClick_Timer(160,560,205,470,1500)
}
return 