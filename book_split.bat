<# batch file posh loader
@cls
@echo off

powershell.exe -command "start powershell -ArgumentList ""-command """"""iex ([System.IO.File]::ReadAllText('%0'))"""""""""""

goto :EOF
#>

if(test-path("./parts")) { rd -Force -Recurse "./parts" }
md "./parts" > $nul

$index = 0
$file = "./parts/00.md"
$text = @{}


">>>>> Step 1/2. Splitting..."

get-content "./hpmor_ru.md" |
foreach {
	if($_.StartsWith("#")) {
		$index += 1
		$file = "./parts/{0:d2} - {1}.md" -f $index, $_.Trim("#", " ")
		$file = $file.Replace(":", " - ")
		$_
	}

	$text[$file] = $text[$file] + $_ + "`r`n"
}


">>>>> Step 2/2. Writing..."

$text.GetEnumerator() |
foreach {
	$_.Key
	$text[$_.Key].Trim(" ", "`t", "`n", "`r") | Out-File -Encoding "UTF8" $_.Key
}


">>>>> Splitted! Press ENTER to finish."

read-host