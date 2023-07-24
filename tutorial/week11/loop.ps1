# this is a simple command
<#
This is an example of multiple lines of comments
#>

$fruits = (
    $("Name","Amount"),
    $("Banana", 12),
    $("Grape", 20),
    $("Apple", 5)
)

Write-Host $fruits

# sort the fruit
$fruits_sorted = $fruits[1..($fruits.Length - 1)] | Sort-Object

# print the sorted fruit:
for ($i=0; $i -le $fruits_sorted.Length -1; $i++){
    Write-Host $fruits_sorted[$i][0]
}


$counter = 0

while($counter -lt $fruits_sorted.Length){
    Write-Host $fruits_sorted[$counter][1]
    $counter++
}