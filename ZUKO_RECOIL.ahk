EnableRCS := true
RecoilControlMode := "1"
RcCustomStrength := 7
RequireToggle := true
ToggleKey := "CapsLock"
DelayRate := 7

recoilStrengths := {"1": 4, "2": 8, "3": 12}
RecoilControlStrength := recoilStrengths.HasKey(RecoilControlMode) ? recoilStrengths[RecoilControlMode] : RcCustomStrength

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
                      