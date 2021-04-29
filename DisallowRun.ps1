# Script to block execution of a specified exe.
# I use this for Adobe Updater OwO

#Requires -RunAsAdministrator

$regedit_string = 
@'
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun]
'@

$error_message = "Usage: $($args[0]) <NewRegistryKeyName> <ExeFileName>)"
$regfile = ".\DisallowRunTemp112341324.reg"

if ($args.Count -lt 2) {
	$error_message
}
else {
	# Alter regedit string with args passed in
	$regedit_string += "`n`"$($args[0])`"=`"$($args[1])`""

	# Create temp regedit file (can't pipe in content)
	Set-Content -Path $regfile -Value $regedit_string

	# Run it (wait before deleting temp file)
	Start-Process -FilePath regedit -ArgumentList "/s", $($regfile) -NoNewWindow -Wait

	# Remove temp regedit file
	Remove-Item $regfile

	Write-Output("New registry entry added:`n")
	$regedit_string
}
