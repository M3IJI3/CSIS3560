$folderPath = '.\fakefolder'

$files = Get-ChildItem -Path $folderPath

Write-Host "This code should not run"

$files.foreach{
    # $_ refers to the files we are reading
    $fileText = Get-Content $_
    $fileText[0]
}

