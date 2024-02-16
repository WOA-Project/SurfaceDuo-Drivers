$CURRENTDATE = Get-Date -Hour 0 -Minute 0 -Second 0
$FIRSTDAYOFMONTH = Get-Date $CURRENTDATE -Day 1
$LASTDAYOFMONTH = Get-Date $FIRSTDAYOFMONTH.AddMonths(1).AddSeconds(-1)
$curday = Get-Date $CURRENTDATE -Format "dd"
$maxday = Get-Date $LASTDAYOFMONTH -Format "dd"
$month = Get-Date $CURRENTDATE -Format "MM"
$year = Get-Date $CURRENTDATE -Format "yy"
$delta = [math]::floor($curday / $maxday * 100)
$version = "$year$month.$delta"
Write-Host $version