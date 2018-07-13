# FLX C++ Learning
# To initialize repos on localhost

param(
    [string] $UserName
)


$git = Get-Command git.exe -ErrorAction SilentlyContinue

cd C:\users\student\Desktop

if(!$git) {
    Write-Host "ERR: git.exe is not present"
}


"Farelogix", "BioNet" | ForEach-Object {

    Write-Host "`n-> Getting $_ repo `n"

    if(Test-Path .\$_) {
        Write-Host "$_ exists, deleting it...`n"
        Remove-Item $_ -Recurse -Force
    }

    Invoke-Expression 'git clone https://github.com/movingpictures83/$_'
}

$UserEmail = Read-Host "`n git password? `n" -AsSecureString

Write-Host "Switching to BioNet repo `n"
cd .\BioNet

Invoke-Expression 'git config user.name "$UserName"'
Invoke-Expression 'git config user.email "$UserEmail"'

Write-Host "Completed!"
