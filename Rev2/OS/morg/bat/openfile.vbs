Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.AppActivate("Xgpro")
WScript.sleep 100
WshShell.SendKeys "^{o}"
WScript.sleep 100
For i = 1 To 9
    WshShell.SendKeys "{TAB}"
Next
WshShell.SendKeys "{ENTER}"
For i = 1 To 8
    WshShell.SendKeys "{TAB}"
Next
WshShell.SendKeys "{DOWN}"
WshShell.SendKeys "{ENTER}"
For i = 1 To 3
    WshShell.SendKeys "{TAB}"
Next
WshShell.SendKeys "{DOWN}"
For i = 1 To 4
    WshShell.SendKeys "{TAB}"
Next
WshShell.SendKeys "{ENTER}"
WScript.quit