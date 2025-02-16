EnableRCS := true
RecoilControlMode := "1"
RcCustomStrength := 7
RequireToggle := true
ToggleKey := "CapsLock"
DelayRate := 7

recoilStrengths := {"1": 4, "2": 8, "3": 12}
RecoilControlStrength := recoilStrengths.HasKey(RecoilControlMode) ? recoilStrengths[RecoilControlMode] : RcCustomStrength

Gui, Add, Text, x10 y10, Enable RCS:
Gui, Add, Checkbox, x100 y10 vEnableRCS Checked%EnableRCS%
Gui, Add, Text, x10 y40, Recoil Control Mode:
Gui, Add, Edit, x150 y40 vRecoilControlMode w50, %RecoilControlMode%
Gui, Add, Text, x10 y70, Custom Strength:
Gui, Add, Edit, x150 y70 vRcCustomStrength w50, %RcCustomStrength%
Gui, Add, Text, x10 y100, Require Toggle:
Gui, Add, Checkbox, x150 y100 vRequireToggle Checked%RequireToggle%
Gui, Add, Text, x10 y130, Toggle Key:
Gui, Add, Edit, x150 y130 vToggleKey w50, %ToggleKey%
Gui, Add, Text, x10 y160, Delay Rate:
Gui, Add, Edit, x150 y160 vDelayRate w50, %DelayRate%
Gui, Add, Button, x10 y200 gSaveSettings, Save
Gui, Show, w300 h250, Recoil Control Settings
return

SaveSettings:
Gui, Submit, NoHide
return

#Persistent
#InstallMouseHook
SetTimer, CheckMouse, 10
return

CheckMouse:
if (!EnableRCS)
    return

if (RequireToggle && !GetKeyState(ToggleKey, "T"))
    return

if (GetKeyState("RButton", "P")) {
    while (GetKeyState("RButton", "P")) {
        if (GetKeyState("LButton", "P")) {
            while (GetKeyState("LButton", "P")) {
                MouseMove, 0, RecoilControlStrength, 0, R
                Sleep, DelayRate
            }
        }
    }
}
return
