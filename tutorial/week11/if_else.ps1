$fruits = @{
    'yellow' = 'banana';
    'green' = 'grape';
    'red' = 'apple' 
}

$color = 'red'

if($fruits.ContainsKey($color)){
    if($fruits[$color] -eq 'Plum'){
        Write-Host Blue fruit: Plum
    }
    else{
        Write-Host Blue fruit: $fruits[$color]
    }
}
else{
    Write-Host -Message ""
}