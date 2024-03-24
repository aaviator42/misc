/*
Aavi's ultimate AHK Mouse Script
v6, 2024-03-25

I'm using the Redragon M908 Mouse, but this script should work with
basically any mouse if you configure it right.

The G604 has several macro buttons:
 - one to the left of the left-click button (B_fire)
 - twelve on the left side of the mouse (B_1 to B_12), in the following layout:
 
 B_3 | B_6 | B_9 | B_12
 ----|-----|-----|-----
 B_2 | B_5 | B_8 | B_11
 ----|-----|-----|-----
 B_1 | B_4 | B_7 | B_10
 
 
First, we use the mouse_m908 script to  map the macro buttons as follows:

B_fire : F13
B_1    : LCtrl
B_2    : LShift
B_3    : F14
B_4    : F15
B_5    : F16
B_6    : F18
B_7    : F19
B_8    : F20
B_9    : F21
B_10   : F22
B_11   : F23
B_12   : F24

Get the script from https://github.com/aaviator42/mouse_m908
Use the ini file from https://github.com/aaviator42/misc/blob/main/etc/aavi_m908_v1.ini


After remapping, the left side of the mouse operates as:

   F14 | F17 | F20 | F23
 ------|-----|-----|-----
 Shift | F16 | F19 | F22
 ------|-----|-----|-----
 Ctrl  | F15 | F18 | F21
 


Here is what this script allows you to do:

F14					= 	Delete
F15					=	Copy
F16					=	Paste
F13 + F16			=	Paste unformatted
F17					=	Cut
F18					= 	Undo
F19					= 	Redo
F13 + F18 			= 	Save
F13 + F19 			= 	Desktop
F20 				= 	Backspace
F21 				= 	Previous desktop
F22 				= 	Next desktop
F23 				= 	Enter

*/

#MaxHotkeysPerInterval 400

;--No Modifiers

#If, !GetKeyState("F13")
	
	;delete
	F14::
		Send {delete}
	return
	
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
	
	;backspace
	F20::
		Send {backspace}
		return
	
	;prev desktop
	F21::
		KeyWait F21
		SendInput #^{Left}
		Return
		
	;next desktop
	F22::
		KeyWait F22
		SendInput #^{Right}
		Return
			
	;enter
	F23::
		Send {enter}
		return
	
	
#If

;--Modifier 1 (F13)
#If, GetKeyState("F13") 
	;paste unformatted
	F16::
		Send ^+{v}
	return
	
	;save
	F18::
		Send ^{s}
	return
	
	;desktop
	F19::
		Send #{d}
	return	

#If 
;--END Modifier 1
