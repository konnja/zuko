--[[
                      :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!
               ~?WuxiW*`   `"#$$$$8!!!!??!!!
             :X- M$$$$       `"T#$T~!8$WUXU~
            :%`  ~#$$$m:        ~!~ ?$$$$$$
          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~

--]]
---                              R E C O I L  C O N T R O L                               ----

EnableRCS = true
RecoilControlMode = "1"
RcCustomStrength = 7
RequireToggle = true
ToggleKey = "CapsLock"
DelayRate = 7

-------------  Recoil Presets ------

local recoilStrengths = {["1"] = 5}
RecoilControlStrength = recoilStrengths[RecoilControlMode] or RcCustomStrength

---------- SCRIPT -----------

EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg)
    if not EnableRCS then return end
    if RequireToggle and not IsKeyLockOn(ToggleKey) then return end
    if IsMouseButtonPressed(3) then
        repeat
            if IsMouseButtonPressed(1) then
                repeat
                    MoveMouseRelative(0, RecoilControlStrength)
                    Sleep(DelayRate)
                until not IsMouseButtonPressed(1)
            end
        until not IsMouseButtonPressed(3)
    end
end
