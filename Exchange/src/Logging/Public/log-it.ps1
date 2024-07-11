function LogIt
{
  param (
    [Parameter(Mandatory=$true)]
    $message,
    [Parameter(Mandatory=$true)]
    $component,
    [Parameter(Mandatory=$true)]
    $type,
    [Parameter(Mandatory=$true)]
    $remoteScriptName)

  $Global:ScriptName = $remoteScriptName

  switch ($type)
  {
    1 {$type = 'Info'}
    2 {$type = 'Warning'}
    3 {$type = 'Error'}
    4 {$type = 'Verbose'}
  }


  if(($type -eq 'Verbose') -and ($Global:Verbose)){
    $toLog = "{0} `$$<{1}><{2} {3}><thread={4}>" -f ($type + ":" + $message), ($Global:ScriptName + ":" + `
    $component), (Get-Date -Format "MM-dd-yyyy"), (Get-Date -Format "HH:mm"), $pid
    $toLog | Out-File -Append -Encoding utf8 -FilePath ("filesystem::{0}" -f $Global:LogFIle)
    #Write-Host $message
  }
  elseif($type -ne 'Verbose'){
    $toLog = "{0} `$$<{1}><{2} {3}><thread={4}>" -f ($type + ":" + $message), ($Global:ScriptName + ":" + `
    $component), (Get-Date -Format "MM-dd-yyyy"), (Get-Date -Format "HH:mm"), $pid
    $toLog | Out-File -Append -Encoding utf8 -FilePath ("filesystem::{0}" -f $Global:LogFIle)
    #Write-Host $message
  }
  if (($type -eq 'Warning') -and ($Global:ScriptStatus -ne 'Error')) {$Global:ScriptStatus=$type}
  if ($type -eq 'Error'){$Global:ScriptStatus = $type}

  if ((Get-Item $Global:LogFIle).Length/1KB -gt $Global:MaxLogSizeInKB){
    $log = $Global:LogFIle
    Remove-Item ($log.Replace(".log", ".lo_"))
    Rename-Item $Global:LogFIle ($log.Replace(".log", ".lo_")) -Force
  }
}

function GetScriptDirectory
{
  $invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $invocation.MyCommand.Path
}

$VerboseLogging = 'true'
[bool]$Global:Verbose = [System.Convert]::Toboolean($VerboseLogging)

$Global:LogFile = "C:\temp\mylog.log"

if (([string]::IsNullOrEmpty($Global:LogFile))) {
  $Global:LogFile = Join-Path (GetScriptDirectory) 'LogIt.log'
}


$Global:MaxLogSizeInKB = 10240
$Global:ScriptName = 'LogIT.ps1'
$Global:ScriptStatus = 'Success'