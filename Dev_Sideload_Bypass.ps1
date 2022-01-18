echo "   "
echo "Adjusting Developer License Settings For:"
echo $Env
echo "Script Initiated: "
echo $runTime

Add-Type -AssemblyName  System.Windows.Forms 

$global:balloon = New-Object System.Windows.Forms.NotifyIcon 

#Handler
[void](Register-ObjectEvent  -InputObject $balloon  -EventName MouseDoubleClick  -SourceIdentifier IconClicked  -Action {
  $global:balloon.dispose()
  Unregister-Event  -SourceIdentifier IconClicked
  Remove-Job -Name IconClicked
  Remove-Variable  -Name balloon  -Scope Global
})

$path = (Get-Process -id $pid).Path
$balloon.Icon  = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 

$obj = new-object -com wscript.shell 


  [System.Windows.Forms.ToolTipIcon] | Get-Member -Static -Type Property
  $balloon.BalloonTipIcon  = [System.Windows.Forms.ToolTipIcon]::Info
  $balloon.BalloonTipText  = '[Action Attempted] 
  *Registry Change Action Attempted*'
  $balloon.BalloonTipTitle  = "Attention $Env:USERNAME" 
  $balloon.Visible  = $true 
  $balloon.ShowBalloonTip(5000)

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"



PrintMessageAndExit $UiStrings.Success $ErrorCodes.Success
PAUSE
