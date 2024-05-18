/*
Aavi's ultimate AHK Keyboard Script
v5.2, 2024-05-18, for ThinkPad with Windows 11
Uses AHK v1


Caps Lock is diabled and used as the mod key, which allows 
us to make use of different functions.


Here is what this script allows you to do:

CapsLock + Space 	=	Mute
CapsLock + Up 		=	Brightness +
CapsLock + Down		=	Brightness -
CapsLock + Right	=	Vol +
CapsLock + Left		=	Vol -
CapsLock + `		= 	Clipboard type for websites that block paste
CapsLock + S		= 	Type ¯\_(ツ)_/¯
CapsLock + E		=	PowerToys text extract
CapsLock + C		=	PowerToys color picker
CapsLock + W		= 	Alt + F4


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
	AdjustScreenBrightness(10)
return

CapsLock & Down::
	AdjustScreenBrightness(-10)
return

CapsLock & S::
	Send ¯\_(ツ)_/¯
return


CapsLock & `::
	SendRaw %clipboard%
return

CapsLock & W::
	Send !{F4}
return

; -- POWERTOYS

; Text extract
CapsLock & E::
	Send #+{T}
return

; Color picker
CapsLock & C::
	Send #+{C}
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
}

