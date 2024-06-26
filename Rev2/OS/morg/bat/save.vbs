Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.SendKeys "{ENTER}"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{DOWN}"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "{ENTER}"
WScript.sleep 500
WshShell.SendKeys "{M}"
WshShell.SendKeys "{O}"
WshShell.SendKeys "{R}"
WshShell.SendKeys "{G}"
WScript.sleep 100
WshShell.SendKeys "{ENTER}"
WshShell.SendKeys "{ENTER}"
WScript.quit