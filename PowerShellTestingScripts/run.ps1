#
# run.ps1
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

#Start Nginx:
#cd ..\..\SuperWebSocket_GitHub\nginx-1.11.0
Start-Process -FilePath  (Get-Item –Path "..\nginx-1.11.0\Nginx.exe").FullName; #-Wait -NoNewWindow;

#Open 5 IE tabs each with a different port number
$url = (Get-Item –Path "..\TestWeb\websocket.html").FullName
$url += "?BizId="
$ie = New-Object -ComObject InternetExplorer.Application;
$ie.Navigate2(($url + "2020"));
$ie.Navigate2(($url + "2019"),0x1000);
$ie.Navigate2(($url + "2018"),0x1000);
$ie.Navigate2(($url + "2017"),0x1000);
$ie.Navigate2(($url + "2016"),0x1000);
$ie.Visible = $true;

#List the processes relating to Nginx:
#Get-Process -Name Ng*;

#Stop all of the processes relating to Nginx (if any):
#Stop-Process -Name Nginx;