#
# start_ie_instances.ps1
#

$rootDir = Split-Path -parent $MyInvocation.MyCommand.Definition;

if($rootDir.EndsWith("\") -eq $false)
{
   $rootDir = $rootDir + "\";
}

cd $rootDir;

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