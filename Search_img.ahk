search_img(image,hwnd, byref vx, byref vy,accuracy) {
	pToken:=Gdip_Startup() 
	pBitmapHayStack:=Gdip_BitmapFromhwnd(hwnd) 
	pBitmapNeedle:=Gdip_CreateBitmapFromFile(image) 
	Sleep, 100
	;~ test := % Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,0,0,0,0,accuracy,0x000000,1,1)
	;~ MsgBox, %pBitmapHayStack% %pBitmapNeedle% %accuracy% , %test%
	if Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,0,0,0,0,accuracy,,1,1) {  
		StringSplit, LISTArray, LIST, `,  
		vx:=LISTArray1 
		vy:=LISTArray2
		;~ msgbox, % Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,0,0,0,0,accuracy,0x000000,1,1)
		Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
		Gdip_Shutdown(pToken)
		printLog(image . " x : " . vx . ", y : " + vy)
		return true
	}
	else 
	{
		Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
		Gdip_Shutdown(pToken)
		return false
	}
}

search_img_GPS(image,hwnd, byref vx, byref vy,accuracy,x1,y1,x2,y2) {
	pToken:=Gdip_Startup() 
	pBitmapHayStack:=Gdip_BitmapFromhwnd(hwnd) 
	pBitmapNeedle:=Gdip_CreateBitmapFromFile(image) 
	Sleep, 100
	;~ test := % Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,x1,y1,x2,y2,accuracy,,1,1)
	;~ MsgBox, %pBitmapHayStack% %pBitmapNeedle% %accuracy% , %test%, %x1%,%y1%,%x2%,%y2%, %list%
	if Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,x1,y1,x2,y2,accuracy,,1,1) {  
		StringSplit, LISTArray, LIST, `,  
		vx:=LISTArray1 
		vy:=LISTArray2
		;~ msgbox, % Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,0,0,0,0,accuracy,0x000000,1,1)
		Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
		Gdip_Shutdown(pToken)
		printLog(image . " x : " . vx . ", y : " + vy)
		return true
	}
	else 
	{
		Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
		Gdip_Shutdown(pToken)
		return false
	}
}

search_img_GPS_trans(image,hwnd, byref vx, byref vy,accuracy,x1,y1,x2,y2) {
	pToken:=Gdip_Startup() 
	pBitmapHayStack:=Gdip_BitmapFromhwnd(hwnd) 
	pBitmapNeedle:=Gdip_CreateBitmapFromFile(image) 
	Sleep, 100
	 ;~ msgbox, % Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,x1,y1,x2,y2,accuracy,"0xFFFFFF",1,1)
	;~ test := % Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,x1,y1,x2,y2,accuracy,,1,1)
	;~ MsgBox, %pBitmapHayStack% %pBitmapNeedle% %accuracy% , %test%, %x1%,%y1%,%x2%,%y2%, %list%
	if Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,x1,y1,x2,y2,accuracy,,1,1) {  
		StringSplit, LISTArray, LIST, `,  
		vx:=LISTArray1 
		vy:=LISTArray2
		;~ msgbox, % Gdip_ImageSearch(pBitmapHayStack,pBitmapNeedle,list,0,0,0,0,accuracy,0x000000,1,1)
		Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
		Gdip_Shutdown(pToken)
		printLog(image . " x : " . vx . ", y : " + vy)
		return true
	}
	else 
	{
		Gdip_DisposeImage(pBitmapHayStack), Gdip_DisposeImage(pBitmapNeedle)
		Gdip_Shutdown(pToken)
		return false
	}
}
