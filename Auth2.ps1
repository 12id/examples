$Request=(Invoke-WebRequest "https://12id.eu/p/embed`$?redirect_uri=http://localhost:80/&client_id=test").Content.Split("`n");For($i=2;$i -le $Request.Length;){
$Request[$i++]};$Request[0];while(!($s=$(Invoke-WebRequest $Request[1]).Content)){Write-Host -NoNewline .;Start-Sleep -s 1};echo "";$s
