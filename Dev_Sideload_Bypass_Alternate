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

  $registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" 
 
$Name1 = "AllowAllTrustedApps" 
$value1 = "1" 
New-ItemProperty -Path $registryPath -Name $name1 -Value $value1 -PropertyType DWORD -Force 
$Name2 = "AllowDevelopmentWithoutDevLicense" 
$value2 = "0" 
 
New-ItemProperty -Path $registryPath -Name $name2 -Value $value2 -PropertyType DWORD -Force


PrintMessageAndExit $UiStrings.Success $ErrorCodes.Success
PAUSE
