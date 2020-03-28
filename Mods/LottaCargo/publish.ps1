# $name is used for the zip (MPK) file
$name = "LottaCargo"

# $modFile is the full path to where we want to place the mod
$documentsPath = [Environment]::GetFolderPath("MyDocuments")
$modsPath = "$documentsPath\AtomicTorchStudio\VoidExpanse\Mods\"
$modFile = "$modsPath\$name.mpk"


# create zip in mod folder, overwrite withi -Force
$zipPath = "$PSScriptRoot\$name.zip"
$items = Get-ChildItem -Path "$PSScriptRoot/src"
Write-Output "Creating $zipPath"
$items | Compress-Archive -DestinationPath $zipPath -CompressionLevel NoCompression -Force

# copy to game mods folder
Copy-Item $zipPath -Destination $modFile -Force
