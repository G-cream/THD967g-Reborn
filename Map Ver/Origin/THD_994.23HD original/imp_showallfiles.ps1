#show all resource names in war3map.imp.
#need to process the first line of the file, or it might be counted as a resource name.
$sln = Get-Content -raw "F:\Backups\Neusoft\THD WorkSpace\THD Craft\MPQEditor\war3map.imp"
Write-Output "------------------------default------------------------"
$sln | Select-String '(?<=\x08).*?(?=\x00)' -AllMatches | Foreach-Object {$_.Matches.Value}
Write-Output "`n`n`n"
Write-Output "------------------------custom------------------------"
$sln | Select-String '(?<=\x0d|\x05).*?(?=\x00)' -AllMatches | Foreach-Object {$_.Matches.Value}