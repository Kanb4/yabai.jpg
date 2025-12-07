Clear-Host

@"
__   __    _           _         ___
\ \ / /   | |         (_)       |_  |
 \ V /__ _| |__   __ _ _          | |_ __   __ _
  \ // _` | '_ \ / _` | |         | | '_ \ / _` |
  | | (_| | |_) | (_| | |  _  /\__/ / |_) | (_| |
  \_/\__,_|_.__/ \__,_|_| (_) \____/| .__/ \__, |
                                    | |     __/ |
                                    |_|    |___/
"@

$output_dir = "."
$output_format = "jpg"

while ($true) {
    Write-Host "Qual formato de saída você deseja?"
    Write-Host "1) JPG"
    Write-Host "2) PNG"
    Write-Host "3) Ambas (JPG e PNG em pastas separadas)"
    $format_choice = Read-Host -Prompt "Escolha uma opção [1-3]"

    switch ($format_choice) {
        "1" {
            $output_format = "jpg"
            Write-Host "Os arquivos serão convertidos para JPG."
            break
        }
        "2" {
            $output_format = "png"
            Write-Host "Os arquivos serão convertidos para PNG."
            break
        }
        "3" {
            $output_format = "both"
            Write-Host "Os arquivos serão convertidos para JPG e PNG, salvos em pastas separadas no diretório atual."
            break
        }
        default {
            Write-Host "Opção inválida. Por favor, tente novamente." -ForegroundColor Red
        }
    }
}

if ($output_format -ne "both") {
    while ($true) {
        Write-Host "Onde você deseja salvar os arquivos convertidos?"
        Write-Host "1) Na pasta atual"
        Write-Host "2) Em uma nova pasta chamada 'convertido'"
        $choice = Read-Host -Prompt "Escolha uma opção [1-2]"

        switch ($choice) {
            "1" {
                Write-Host "Os arquivos serão salvos na pasta atual."
                break
            }
            "2" {
                $output_dir = "convertido"
                New-Item -ItemType Directory -Path $output_dir -Force | Out-Null
                Write-Host "Os arquivos serão salvos na pasta '$output_dir'."
                break
            }
            default {
                Write-Host "Opção inválida. Por favor, tente novamente." -ForegroundColor Red
            }
        }
    }
}

$files = Get-ChildItem -Path . -Filter "*.psd"
$total_files = $files.Count

if ($total_files -eq 0) {
    Write-Host "Nenhum arquivo .psd encontrado para conversão." -ForegroundColor Yellow
    Read-Host -Prompt "Pressione Enter para sair"
    exit
}

Write-Host "Encontrados $total_files arquivos para conversão."

function Show-ProgressBar {
    param(
        [int]$current,
        [int]$total
    )
    $width = 40
    $percentage = [math]::Round($current * 100 / $total)
    $filled_len = [math]::Round($width * $current / $total)
    $unfilled_len = $width - $filled_len

    $bar = ('#' * $filled_len) + ('-' * $unfilled_len)

    Write-Host -NoNewline "`rProcessando: [$bar] $percentage% ($current/$total)"
}

if ($output_format -eq "both") {
    New-Item -ItemType Directory -Path "jpg", "png" -Force | Out-Null
    $current_file = 0
    foreach ($img in $files) {
        $current_file++
        $imgname = $img.BaseName
        & magick "$($img.FullName)[0]" "jpg\$imgname.jpg"
        & magick "$($img.FullName)[0]" "png\$imgname.png"
        Show-ProgressBar -current $current_file -total $total_files
    }
    Write-Host "`nConversão para JPG e PNG concluída." -ForegroundColor Green
}
else {
    $current_file = 0
    foreach ($img in $files) {
        $current_file++
        $imgname = $img.BaseName
        $destination_path = Join-Path -Path $output_dir -ChildPath "$imgname.$output_format"
        & magick "$($img.FullName)[0]" $destination_path
        Show-ProgressBar -current $current_file -total $total_files
    }
    Write-Host "`nConversão para $($output_format.ToUpper()) concluída." -ForegroundColor Green
}

@"

__   __    _           _         ___
\ \ / /   | |         (_)       |_  |
 \ V /__ _| |__   __ _ _          | |_ __   __ _
  \ // _` | '_ \ / _` | |         | | '_ \ / _` |
  | | (_| | |_) | (_| | |  _  /\__/ / |_) | (_| |
  \_/\__,_|_.__/ \__,_|_| (_) \____/| .__/ \__, |
                                    | |     __/ |
                                    |_|    |___/
"@

Read-Host -Prompt "Pressione Enter para sair"
