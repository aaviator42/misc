;run programs or scripts invisibly
;by aaviator42
;
;usage:
;   inv <command> <args>

if wscript.arguments.count = 0 then
    WScript.Quit
end if

For each ag in wscript.arguments
    CMDLINE = CMDLINE & " " & ag
Next

CreateObject("Wscript.Shell").Run "" & mid(CMDLINE, 2) & "", 0, False 