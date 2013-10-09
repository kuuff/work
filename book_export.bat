<# batch file posh loader
@cls
@powershell.exe -command "iex ([System.IO.File]::ReadAllText('%0'))"
:: @pause
@goto :EOF
#>

if(test-path("./export")) { rd -Force -Recurse "./export" }
md "./export" > $nul

"to epub..."; pandoc --from=markdown --smart --output=export/hpmor_ru.epub --epub-cover-image=images/cover.jpg hpmor_ru.md
# "to pdf..."; pandoc --from=markdown --to=pdf --output=export/hpmor_ru.pdf hpmor_ru.md

"to html..."; pandoc --from=markdown --smart --standalone --output=export/hpmor_ru.html --toc hpmor_ru.md
$content = [System.IO.File]::ReadAllText("./export/hpmor_ru.html")
$content = $content.Replace("./images/", "../images/")
$content | Out-File "./export/hpmor_ru.html"

"to fb2..."; pandoc --from=markdown --smart --output=export/hpmor_ru.fb2 hpmor_ru.md
"to docx..."; pandoc --from=markdown --smart --output=export/hpmor_ru.docx --toc hpmor_ru.md
"to mobi..."; pandoc --from=markdown --smart --output=export/hpmor_ru.mobi hpmor_ru.md

"Export completed!"

read-host