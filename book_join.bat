<# batch file posh loader
@cls
@powershell.exe -command "iex ([System.IO.File]::ReadAllText('%0'))"
:: @pause
@goto :EOF
#>

if(test-path("./hpmor_ru_joined.md")) {
	del "./hpmor_ru_joined.md"
}

dir "./parts" | sort { $_.FullName } | 
foreach {
	$_.Name
	$content = get-content $_.FullName
	$content >> "./hpmor_ru_joined.md"
}

"Joined! Press ENTER to finish."

read-host