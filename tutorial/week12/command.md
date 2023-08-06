# csv command in power shell
get-process | select-object -property CPU,Id,Name | Sort-Object CPU -Descending | select-object  -First 5 | export-csv -Path process.csv

# json comman in power shell
import-csv .\process.csv | ConvertTo-Json
get-content .\process.json | ConvertFrom-Json