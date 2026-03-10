#Requires AutoHotkey v2.0

CheckChrome() {
    for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process Where Name = 'chrome.exe'") {
        return true
    }
    return false
}

if !CheckChrome() {
    MsgBox("Google Chrome nie jest uruchomiony!", "Uwaga", "Icon!")
} else {
    WinActivate("ahk_exe chrome.exe")
    WinMaximize("ahk_exe chrome.exe")


    ; Otwórz DevTools
    Send("{F12}")
    Sleep 1500  ; Czekaj aż DevTools się załaduje

    ; Otwórz Command Menu
    Send("^+p")
    Sleep 800
    ; Wpisz polecenie screenshotu
    SendText("Capture full")
    Sleep 500
    Send("{Enter}")

    ; Generowanie pełnego screenshota często trwa 1-3 sekundy zależnie od długości strony
    Sleep 2000
    ; Zamknij DevTools
    Send("{F12}")
}