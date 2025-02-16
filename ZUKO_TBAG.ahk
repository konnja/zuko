; AutoHotkey Script: Spacebar Loop Controlled by F1 (start) and F2 (stop)

F1::  ; Press F1 to start the loop
    SetTimer, AutoSpace, 10  ; Start timer: call AutoSpace every 10ms
return

F2::  ; Press F2 to stop the loop
    SetTimer, AutoSpace, Off  ; Stop the timer
return

AutoSpace:
    Send, {Space}  ; Simulate pressing the spacebar
return
