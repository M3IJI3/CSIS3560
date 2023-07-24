$folderPath = '.\fakefolder'

try {
    $files = Get-ChildItem -Path $folderPath -ErrorAction Stop

    Write-Host "This code should not run"

    $files.foreach({
        # $_ refers to the files we are reading
        $fileText = Get-Content $_
        $fileText[0]
    })
}
catch {
    <# Do this if a terminating exception happens #>
    Write-Error "An error happens"
    $_.Exception.Message # $_ refers to the exception
}

