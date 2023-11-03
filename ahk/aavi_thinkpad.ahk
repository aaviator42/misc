; Aavi's ThinkPad AHK Mappings
; You might have to modify keys depending on your layout
; v1, 2023-11-03

; Map Fn to Ctrl
; This works for some shortcuts, not all. This is because
; Lenovo drivers/firmware seems to map Fn + certain keys
; to specific functions
; Eg: Fn + A will act as Ctrl + A, 
; but Fn + S doesn't act as Ctrl + S
SC163::Ctrl

; Map PrintScreen to Menu key
; But have Win + PrintScreen still work as it should
PrintScreen::AppsKey
#PrintScreen::#PrintScreen

; Swap PageUp and Home
Home::PgUp
PgUp::Home

; Swap PageDown and End
End::PgDn
PgDn::End

; Fallback PageUp
CapsLock & PgUp::PgUp
PrintScreen & PgUp::PgUp

; Fallback PageDown
CapsLock & PgDn::PgDn
PrintScreen & PgDn::PgDn
