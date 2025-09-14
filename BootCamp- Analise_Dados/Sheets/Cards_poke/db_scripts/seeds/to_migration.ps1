#Pegar o diretorio atual (cpy path)
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Arquivo de saida com todos os sql
$outputFile = Join-Path -Path $scriptDirectory -ChildPath "migration.sql"

# Verifica se o arquivo ja existe, se existir deleta
if (Test-Path $outputFile){
    Remove-Item $outputFile
}

#Pega o conteudo dos arquivos 
$sqlFiles = Get-ChildItem -Path $scriptDirectory -Filter *.sql -File | Sort-Object Name

# concatenar arquivos 
foreach($file in $sqlFiles){
    Get-Content $file.FullName | Out-File -Append -FilePath $outputFile 
    "GO" | Out-File -Append -FilePath $outputFile
}

Write-Host "Todos os arquivos foram concatenados em $outputFile"