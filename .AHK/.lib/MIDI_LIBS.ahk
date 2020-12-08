;OpenCloseMidiAPI() {
;    static hModule
;    If hModule
;        DllCall("FreeLibrary", UInt,hModule), hModule := ""
;    If (0 = hModule := DllCall("LoadLibrary",Str,"winmm.dll")) {
;        MsgBox Cannot load libray winmm.dll
;        Exit
;    }
;}