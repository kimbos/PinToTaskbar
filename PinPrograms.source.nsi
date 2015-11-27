!include 'StdUtils.nsh'
!include FileFunc.nsh
!include LogicLib.nsh

OutFile "C:\PinProgram.exe"

VIProductVersion 1.0.0.0
VIAddVersionKey FileVersion 1.0
Caption "PinProgram"

SilentInstall silent
RequestExecutionLevel user
ShowInstDetails hide

var DIR
var FILE
var ACTION


Section	Main

${GetParameters} $R0
ClearErrors
${GetOptions} $R0 '/DIR:' $DIR

${GetParameters} $R0
ClearErrors
${GetOptions} $R0 '/FILE:' $FILE

${GetParameters} $R0
ClearErrors
${GetOptions} $R0 '/ACTION:' $ACTION


${Switch} $ACTION
	${Case} "PinTaskbar"
		${StdUtils.InvokeShellVerb} $0 "$DIR" "$FILE" ${StdUtils.Const.ShellVerb.PinToTaskbar}
		Quit
	${Case} "UnpinTaskbar"
		${StdUtils.InvokeShellVerb} $0 "$DIR" "$FILE" ${StdUtils.Const.ShellVerb.UnpinFromTaskbar}
		Quit
	${Case} "PinStart"
		${StdUtils.InvokeShellVerb} $0 "$DIR" "$FILE" ${StdUtils.Const.ShellVerb.PinToStart}
		Quit
	${Case} "UnpinStart"
		${StdUtils.InvokeShellVerb} $0 "$DIR" "$FILE" ${StdUtils.Const.ShellVerb.UnpinFromStart}
		Quit
	${Default}
		MessageBox MB_OK "Usage: $\r$\n PinProgram.exe /DIR:C:\Windows /FILE:notepad.exe /ACTION:PinTaskbar $\r$\n Valid actions are: PinTaskbar, UnpinTaskbar, PinStart, UnpinStart"
		Quit
${EndSwitch}

SectionEnd
