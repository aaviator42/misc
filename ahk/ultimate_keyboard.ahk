/*
Aavi's ultimate AHK Keyboard Script
v4, 2022-03-07

I'm using the E-Yooso K620, but this script should work with
basically any keyboard if you configure it right.

Caps Lock is diabled and used as the mod key, which allows 
us to make use of different functions.


Here is what this script allows you to do:

CapsLock + Space 	=	Mute
CapsLock + Up 		=	Brightness +
CapsLock + Down		=	Brightness -
CapsLock + Right	=	Vol +
CapsLock + Left		=	Vol -
CapsLock + A		= 	First Firefox container tab (Ctrl + Shift + 1)
Ctrl + CapsLock		= 	First Firefox container tab (Ctrl + Shift + 1)
CapsLock + `		= 	Clipboard type for website that block paste
CapsLock + S		= 	Type ¯\_(ツ)_/¯
CapsLock + D		= 	Type (ಠ_ಠ)
CapsLock + O		= 	Type (⚆_⚆)
CapsLock + L		= 	Type ( ͡° ͜ʖ ͡°)
CapsLock + C		= 	Type (ಥ_ಥ)
CapsLock + T		= 	Type (¬_¬)
CapsLock + X		= 	Type (ಠ益ಠ)
CapsLock + V		= 	Type (≧▽≦)
CapsLock + U		= 	Type (◕‿◕)
CapsLock + W		= 	Type (◉ω◉)
CapsLock + Q		= 	Type ᕕ( ᐛ ) ᕗ


Notes:
 - You might have to change brightness values below depending
   on your system.

 - Save in Notepad with UTF-8 BOM encoding for proper unicode 
   support.

*/
    
#MaxHotkeysPerInterval
#SingleInstance

SetCapsLockState, Off
SetCapsLockState, AlwaysOff

*CapsLock::shift

CapsLock & Space::
	Send {Volume_Mute}
return

CapsLock & Left::
	Send {Volume_Down}
return

CapsLock & Right::
	Send {Volume_Up}
return

CapsLock & Up::
	AdjustScreenBrightness(50)
return

CapsLock & Down::
	AdjustScreenBrightness(-2)
return

CapsLock & A::
^CapsLock::
	Send ^+1
return

CapsLock & S::
	Send ¯\_(ツ)_/¯
return

CapsLock & D::
	Send (ಠ_ಠ)
return

CapsLock & O::
	Send (⚆_⚆)
return

CapsLock & L::
	Send ( ͡° ͜ʖ ͡°)
return

CapsLock & C::
	Send (ಥ_ಥ)
return

CapsLock & T::
	Send (¬_¬)
return

CapsLock & X::
	Send (ಠ益ಠ)
return

CapsLock & V::
	Send (≧▽≦)
return

CapsLock & U::
	Send (◕‿◕)
return

CapsLock & W::
	Send (◉ω◉)
return

CapsLock & Q::
	Send ᕕ( ᐛ ) ᕗ
return

CapsLock & `::
	SendRaw %clipboard%
return





;-------------------
; https://gist.github.com/krrr/3c3f1747480189dbb71f?permalink_comment_id=3683539#gistcomment-3683539


AdjustScreenBrightness(step) {
	static service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
	monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
	monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
	for i in monitors {
		curr := i.CurrentBrightness
		break
	}
	toSet := curr + step
	if (toSet < 10)
		toSet := 10
	if (toSet > 100)
		toSet := 100
	for i in monMethods {
		i.WmiSetBrightness(1, toSet)
		break
	}
	BrightnessOSD()
}

BrightnessOSD() {
	static PostMessagePtr := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", A_IsUnicode ? "PostMessageW" : "PostMessageA", "Ptr")
	 ,WM_SHELLHOOK := DllCall("RegisterWindowMessage", "Str", "SHELLHOOK", "UInt")
	static FindWindow := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", A_IsUnicode ? "FindWindowW" : "FindWindowA", "Ptr")
	HWND := DllCall(FindWindow, "Str", "NativeHWNDHost", "Str", "", "Ptr")
	IF !(HWND) {
		try IF ((shellProvider := ComObjCreate("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}"))) {
			try IF ((flyoutDisp := ComObjQuery(shellProvider, "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}", "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}"))) {
				DllCall(NumGet(NumGet(flyoutDisp+0)+3*A_PtrSize), "Ptr", flyoutDisp, "Int", 0, "UInt", 0)
				 ,ObjRelease(flyoutDisp)
			}
			ObjRelease(shellProvider)
		}
		HWND := DllCall(FindWindow, "Str", "NativeHWNDHost", "Str", "", "Ptr")
	}
	DllCall(PostMessagePtr, "Ptr", HWND, "UInt", WM_SHELLHOOK, "Ptr", 0x37, "Ptr", 0)
}