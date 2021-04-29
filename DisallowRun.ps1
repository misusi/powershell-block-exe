# Script to block execution of a specified exe.
# I use this for Adobe Updater OwO

#Requires -RunAsAdministrator

$regedit_string = 
@'
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun]
'@

$error_message = "Usage: $($args[0]) <NewRegistryKeyName> <ExeFileName>)"
$regfile = ".\DisallowRunTemp.reg"

if ($args.Count -lt 2) {
	$error_message
}
else {
	# Alter regedit string with args passed in
	$regedit_string += "`n`"$($args[0])`"=`"$($args[1])`""

	# Create temp regedit file
	Set-Content -Path $regfile -Value $regedit_string

	# Run it
	#Invoke-Command {reg import $regfile *>&1 | Out-Null}
	regedit /s $regfile

	# Remove temp regedit file
	Remove-Item $regfile

	"New registry entry added:`n"
	$regedit_string

}
