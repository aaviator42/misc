/*
Aavi's ultimate AHK Mouse Script
v5, 2021-12-31

I'm using the Logitech G640 Mouse, but this script should work with
basically any mouse if you configure it right.

The G604 has several macro buttons:
 - two to the left of the left-click button (G11 on top, G10 under it)
 - six on the left side of the mouse, in the following layout:
 
 G9 | G8 | G7
 ---|----|---
 G6 | G5 | G4

First, we use logitech G HUB software to map the macro buttons as follows:

G11: F13
G10: F14
G9:  F15
G6:  F16
G8:  F17
G5:  F18
G7:  DPI cycle
G4:  F19

Configure DPI speeds in G HUB, and then G7 can be used to cycle between them.

We use F13 and F14 as modifiers, and F15 through F19 as "action" keys that 
actually do stuff.

After remapping, the left side of the mouse operates as:

 F15 | F17 | DPI cycle
 ----|-----|----------
 F16 | F18 | F19


Here is what this script allows you to do:

F15					=	Copy
F16					=	Paste
F14 + F16			=	Paste unformatted
F17					=	Cut
F18					= 	Undo
F19					= 	Redo

F14 + F17				= 	Go to desktop
F14 + F15				= 	Save

F13 + Scroll Up/Down		=	Horizontal scroll
F14 + Scroll Up/Down		=	Zoom
F13 + F14 + Scroll Up/Down	=	Fast Scroll

Notes:
 - You might have to change sleep interval under zoom and fast scroll 
   depending on the software and mouse you use

*/

#MaxHotkeysPerInterval 400

;--No Modifiers

#If, !GetKeyState("F13") & !GetKeyState("F14")

	;copy
	F15::
		Send ^{c}
	return
	
	;paste
	F16::
		Send ^{v}
	return
	
	;cut
	F17::
		Send ^{x}
	return
	
	;undo
	F18::
		Send ^{z}
	return
	
	;redo
	F19::
		Send ^{y}
	return
	
#If

;--Modifier 1 (G11/F13)
#If, GetKeyState("F13") & !GetKeyState("F14")

	;scroll right
	WheelUp::
		Send +{WheelUp}
	return
	
	;scroll left
	WheelDown::
		Send +{WheelDown}
	return

#If 
;--END Modifier 1

;--Modifier 2 (G10/F14)
#If, GetKeyState("F14") & !GetKeyState("F13")

	;paste unformatted
	F16::
		Send ^+{v}
	return
	
	;zoom in
	WheelUp::
		Send ^{WheelUp}
		Sleep 50
	return
	
	;zoom out
	WheelDown::
		Send ^{WheelDown}
		Sleep 50
	return

	;save
	F15::
		Send ^{s}
	return
	
	;desktop
	F17::
		Send #{d}
	return	

#If 
;--END Modifier 2


;--Modifier 1+2 (G11/F13 + G10/F14)
#If, GetKeyState("F13") & GetKeyState("F14")
	
	;scroll fast up
	WheelUp::
		Send {WheelUp}
		Send {WheelUp}
		Send {WheelUp}
		Send {WheelUp}
		Send {WheelUp}
		Sleep 50
	return
	
	;scroll fast down
	WheelDown::
		Send {WheelDown}
		Send {WheelDown}
		Send {WheelDown}
		Send {WheelDown}
		Send {WheelDown}
		Sleep 50
	return

#If 
;--END Modifier 1+2
