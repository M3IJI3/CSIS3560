# grab files from a folder
$fileList = Get-ChildItem .\week11 -File

# we will collect infomation as array of object
$fileInfoList = @()

foreach ($file in $fileList){
    # create an object containing the name, length(size), and access the name 
    $fileInfo = [PSCustomObject]@{
        Name = $file.Name
        Length = $file.Length
        LastAccessTimeUTC = $file.LastAccessTimeUtc
    }

    # add the fileinfo object into array
    $fileInfoList += $fileInfo
}

# display it in a nice tabular format
$fileInfoList | Format-Table

# save it as a csv file
$fileInfoList | Export-Csv -Path ./fileInfor.csv