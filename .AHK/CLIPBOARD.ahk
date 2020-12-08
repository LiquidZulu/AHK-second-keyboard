#include %A_LineFile%\..\VARIABLES.ahk
#include %A_LineFile%\..\SECRET.ahk
#include %A_LineFile%\..\.lib\AHK_CNG-master\src\Class_CNG.ahk

CLIPBOARD_MANAGER(cboard, ACTION){

    global CLIPBOARDS
    global KEY_REL_CLIP
    global CLIPBOARD_COPY
    global CLIPBOARD_PASTE
    global SECRET

    ;MsgBox % CLIPBOARDS["BIN"][CLIPBOARDS["MAP"][cboard][KEY_REL_CLIP]]

    Switch ACTION
    {
        case CLIPBOARD_COPY:
            prevcboard := ClipboardAll
            Clipboard =""
            SendInput, ^c
            ClipWait, 1
            if ErrorLevel{
                MsgBox, % "error: failed to retrieve clipboard text"
                return
            }
            CLIPBOARDS["IV"][CLIPBOARDS["MAP"][cboard][KEY_REL_CLIP]]  := IV()
            CLIPBOARDS["BIN"][CLIPBOARDS["MAP"][cboard][KEY_REL_CLIP]] := Crypt.Encrypt.String("AES", "CBC", Clipboard, SECRET["CLIPBOARD_ENCRYPTION_KEY"], CLIPBOARDS["IV"][CLIPBOARDS["MAP"][cboard][KEY_REL_CLIP]])
            Clipboard := prevcboard
            prevcboard = ""
            return
        case CLIPBOARD_PASTE:
            SendInput % REM_ENTER(Crypt.Decrypt.String("AES", "CBC", CLIPBOARDS["BIN"][CLIPBOARDS["MAP"][cboard][KEY_REL_CLIP]], SECRET["CLIPBOARD_ENCRYPTION_KEY"], CLIPBOARDS["IV"][CLIPBOARDS["MAP"][cboard][KEY_REL_CLIP]]))
            return
    }
}

REM_ENTER(s){
    toexport := ""
    Loop, PARSE, s, `n, `r
    {
        toexport .= A_LoopField . "{Shift down}`n{Shift up}"
    }
    return toexport
}