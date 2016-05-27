#
# run.ps1
#

#Start 5 Socket Server instances each with a different port number:
Start-Process -FilePath ..\SuperWebSocketServer\SuperWebSocketServer.exe -ArgumentList @(2020) -Wait -NoNewWindow;

Start-Process -FilePath ..\SuperWebSocketServer\SuperWebSocketServer.exe -ArgumentList @(2019) -Wait -NoNewWindow;

Start-Process -FilePath ..\SuperWebSocketServer\SuperWebSocketServer.exe -ArgumentList @(2018) -Wait -NoNewWindow;

Start-Process -FilePath ..\SuperWebSocketServer\SuperWebSocketServer.exe -ArgumentList @(2017) -Wait -NoNewWindow;

Start-Process -FilePath ..\SuperWebSocketServer\SuperWebSocketServer.exe -ArgumentList @(2016) -Wait -NoNewWindow;

#Start Ngnix:
#cd ..\..\SuperWebSocket_GitHub\nginx-1.11.0
Start-Process -FilePath  ..\nginx-1.11.0\Ngnix.exe -Wait -NoNewWindow;

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