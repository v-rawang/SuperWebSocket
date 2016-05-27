#
# start_ws_instances.ps1
#

$rootDir = Split-Path -parent $MyInvocation.MyCommand.Definition;

if($rootDir.EndsWith("\") -eq $false)
{
   $rootDir = $rootDir + "\";
}

cd $rootDir;

#Start 5 Socket Server instances each with a different port number:
Start-Process -FilePath (Get-Item –Path "..\SuperWebSocketServer\bin\Debug\SuperWebSocketServer.exe").FullName -ArgumentList @(2020); #-Wait -NoNewWindow;

Start-Process -FilePath (Get-Item –Path "..\SuperWebSocketServer\bin\Debug\SuperWebSocketServer.exe").FullName -ArgumentList @(2019); #-Wait -NoNewWindow;

Start-Process -FilePath (Get-Item –Path "..\SuperWebSocketServer\bin\Debug\SuperWebSocketServer.exe").FullName -ArgumentList @(2018); #-Wait -NoNewWindow;

Start-Process -FilePath (Get-Item –Path "..\SuperWebSocketServer\bin\Debug\SuperWebSocketServer.exe").FullName -ArgumentList @(2017); #-Wait -NoNewWindow;

Start-Process -FilePath (Get-Item –Path "..\SuperWebSocketServer\bin\Debug\SuperWebSocketServer.exe").FullName -ArgumentList @(2016); #-Wait -NoNewWindow;