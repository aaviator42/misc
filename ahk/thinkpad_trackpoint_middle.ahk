﻿; from https://web.archive.org/web/20151101000000*/http://forum.notebookreview.com/threads/ultranav-middle-click-button-scroll.423415/
; ahk v1
; 2023-11-16
$*MButton::

Hotkey, $*MButton Up, MButtonup, off
KeyWait, MButton, T0.2
If ErrorLevel = 1
{
	Hotkey, $*MButton Up, MButtonup, on
	MouseGetPos, ox, oy
 	SetTimer, WatchTheMouse, 1
	SystemCursor("Toggle")
}
Else
	Send {MButton}
return

MButtonup:
Hotkey, $*MButton Up, MButtonup, off
SetTimer, WatchTheMouse, off
SystemCursor("Toggle")
return

WatchTheMouse:
MouseGetPos, nx, ny
dy := ny-oy
dx := nx-ox
If (dx**2 > 0 and dx**2>dy**2) ;edit 0 for sensitivity (changes sensitivity to movement)
{
	times := Abs(dy)/1 ;edit 1 for sensitivity (changes frequency of scroll signal)
	Loop, %times%
	{
		If (dx > 0)
			Click WheelRight
		Else
			Click WheelLeft
   	}
}
If (dy**2 > 5 and dy**2>dx**2) ;edit 0 for sensitivity (changes sensitivity to movement)
{
	times := Abs(dy)/5 ;edit 5 for sensitivity (changes frequency of scroll signal)
	Loop, %times% 
	{
		If (dy > 0)
			Click WheelDown
		Else
			Click WheelUp
	}   
}
MouseMove ox, oy
return

SystemCursor(OnOff=1)   ; INIT = "I","Init"; OFF = 0,"Off"; TOGGLE = -1,"T","Toggle"; ON = others
{
    static AndMask, XorMask, $, h_cursor
        ,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13 ; system cursors
        , b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13   ; blank cursors
        , h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13   ; handles of default cursors
    if (OnOff = "Init" or OnOff = "I" or $ = "")       ; init when requested or at first call
    {
        $ = h                                          ; active default cursors
        VarSetCapacity( h_cursor,4444, 1 )
        VarSetCapacity( AndMask, 32*4, 0xFF )
        VarSetCapacity( XorMask, 32*4, 0 )
        system_cursors = 32512,32513,32514,32515,32516,32642,32643,32644,32645,32646,32648,32649,32650
        StringSplit c, system_cursors, `,
        Loop %c0%
        {
            h_cursor   := DllCall( "LoadCursor", "uint",0, "uint",c%A_Index% )
            h%A_Index% := DllCall( "CopyImage",  "uint",h_cursor, "uint",2, "int",0, "int",0, "uint",0 )
            b%A_Index% := DllCall("CreateCursor","uint",0, "int",0, "int",0
                , "int",32, "int",32, "uint",&AndMask, "uint",&XorMask )
        }
    }
    if (OnOff = 0 or OnOff = "Off" or $ = "h" and (OnOff < 0 or OnOff = "Toggle" or OnOff = "T"))
        $ = b  ; use blank cursors
    else
        $ = h  ; use the saved cursors

    Loop %c0%
    {
        h_cursor := DllCall( "CopyImage", "uint",%$%%A_Index%, "uint",2, "int",0, "int",0, "uint",0 )
        DllCall( "SetSystemCursor", "uint",h_cursor, "uint",c%A_Index% )
    }
}