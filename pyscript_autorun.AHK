^F3::
	tmp:=Clipboardall
	Clipboard = ; clear clipboard
	Send,^c ; copy selection
	ClipWait,1
	path:=Clipboard
	;~ path := RegExReplace(path , "\s", "\s")
	SplitPath, path, name, OutDir
	Clipboard:=tmp
	if ErrorLevel
		return
	;~ Msgbox, % "Filepath: " path
	SetWorkingDir %OutDir%
	RunWait, PowerShell.exe -NoExit -C py %name%,, ; powershell opened -> see prints
	;~ RunWait, PowerShell.exe py %name%,,hide
return