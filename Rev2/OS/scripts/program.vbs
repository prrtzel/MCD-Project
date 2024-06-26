Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.AppActivate "notepad"
WshShell.SendKeys "{ENTER}"
WshShell.SendKeys "^s"