<# batch file posh loader
@cls
@powershell.exe -command "iex ([System.IO.File]::ReadAllText('%0'))"
:: @pause
@goto :EOF
#>

if(test-path("./hpmor_ru_joined.md")) {
	del "./hpmor_ru_joined.md"
}

dir "./parts" -filter "*.md" |
sort { $_.FullName } | 
foreach {
	$_.Name
	$content = get-content -Encoding "UTF8" $_.FullName
	add-content -Encoding "UTF8" -Value $content -Path "./hpmor_ru_joined.md"
}

"Joined! Press ENTER to finish."

read-host