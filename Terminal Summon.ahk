#Requires AutoHotkey v2.0-a
#WinActivateForce
DetectHiddenWindows true
SC056::
{
	;If WinActive("ahk_exe explorer.exe") {
	;	Explorer()
	;	return
	;}
	ToggleMaxed()
}

Explorer() {
	If WinExist("ahk_exe WindowsTerminal.exe") {
		If WinGetMinMax("ahk_exe WindowsTerminal.exe") != -1 {
			ToggleMaxed()
			return
		}
	}

	path := GetActiveExplorerPath()
	ToggleMaxed()
	if SubStr(path,1,2) == "::" {
		return
	}
	current_clip := A_Clipboard
	A_Clipboard := " "
	Send "^a"
	Send "^x"
	Send "cd `'" path "`'{Enter}"
	Send "Clean-Lines(2){Enter}"
	if A_Clipboard != " " {
		Send "^v"
	}
	Sleep 10
	A_Clipboard := current_clip
}

ToggleMaxed() {
	If !WinExist("ahk_exe WindowsTerminal.exe") {
		Run "wt"
		return
	}

	MinMax := WinGetMinMax("ahk_exe WindowsTerminal.exe")
	If MinMax = -1
	{
		WinActivate "ahk_exe WindowsTerminal.exe"
	} else {
		PostMessage 0x0112, 0xF020,,, "ahk_exe WindowsTerminal.exe"
	}
}

GetActiveExplorerPath() {
	explorerHwnd := WinActive("ahk_class CabinetWClass")
	if (explorerHwnd)
	{
		shell_windows := ComObject("Shell.Application").Windows
		for window in shell_windows
		{
			if (window.hwnd==explorerHwnd)
			{
				return window.Document.Folder.Self.Path
			}
		}
	}
}
