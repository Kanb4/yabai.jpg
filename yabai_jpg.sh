#!/bin/bash

cat << "EOF"
__   __    _           _         ___             
\ \ / /   | |         (_)       |_  |            
 \ V /__ _| |__   __ _ _          | |_ __   __ _ 
  \ // _` | '_ \ / _` | |         | | '_ \ / _` |
  | | (_| | |_) | (_| | |  _  /\__/ / |_) | (_| |
  \_/\__,_|_.__/ \__,_|_| (_) \____/| .__/ \__, |
                                    | |     __/ |
                                    |_|    |___/ 
EOF

output_dir="."
output_format="jpg"

while true; do
    echo "Qual formato de saída você deseja?"
    echo "1) JPG"
    echo "2) PNG"
    echo "3) Ambas (JPG e PNG em pastas separadas)"
    read -p "Escolha uma opção [1-3]: " format_choice

    case $format_choice in
        1)
            output_format="jpg"
            echo "Os arquivos serão convertidos para JPG."
            break
            ;;
        2)
            output_format="png"
            echo "Os arquivos serão convertidos para PNG."
            break
            ;;
        3)
            output_format="both"
            echo "Os arquivos serão convertidos para JPG e PNG, salvos em pastas separadas no diretório atual."
            break
            ;;
        *)
            echo "Opção inválida. Por favor, tente novamente."
            ;;
    esac
done

if [ "$output_format" != "both" ]; then
    while true; do
        echo "Onde você deseja salvar os arquivos convertidos?"
        echo "1) Na pasta atual"
        echo "2) Em uma nova pasta chamada 'convertido'"
        read -p "Escolha uma opção [1-2]: " choice

        case $choice in
            1)
                echo "Os arquivos serão salvos na pasta atual."
                break
                ;;
            2)
                output_dir="convertido"
                mkdir -p "$output_dir"
                echo "Os arquivos serão salvos na pasta '$output_dir'."
                break
                ;;
            *)
                echo "Opção inválida. Por favor, tente novamente."
                ;;
        esac
    done
fi

shopt -s nullglob

files=(*.{psd,PSD})
total_files=${#files[@]}

if [ "$total_files" -eq 0 ]; then
    echo "Nenhum arquivo .psd ou .PSD encontrado para conversão."
    exit 0
fi

echo "Encontrados $total_files arquivos para conversão."

progress_bar() {
    local current=$1
    local total=$2
    local width=40

    local percentage=$((current * 100 / total))
    local filled_len=$((width * current / total))


    local bar
    printf -v bar '%*s' "$filled_len" ''
    bar=${bar// /#}
    printf -v bar '%-*s' "$width" "$bar"
    bar=${bar// /-}

    printf "\rProcessando: [%s] %d%% (%d/%d)" "$bar" "$percentage" "$current" "$total"
}

if [ "$output_format" = "both" ]; then
    mkdir -p jpg png
    current_file=0
    for img in "${files[@]}"; do
        ((current_file++))
        imgname="${img%.*}"
        convert "$img[0]" "jpg/$imgname.jpg" >/dev/null 2>&1
        convert "$img[0]" "png/$imgname.png" >/dev/null 2>&1
        progress_bar "$current_file" "$total_files"
    done
    echo -e "\nConversão para JPG e PNG concluída."
else
    current_file=0
    for img in "${files[@]}"; do
        ((current_file++))
        imgname="${img%.*}"
        convert "$img[0]" "$output_dir/$imgname.$output_format" >/dev/null 2>&1
        progress_bar "$current_file" "$total_files"
    done
    echo -e "\nConversão para ${output_format^^} concluída."
fi


cat << "EOF"
__   __    _           _         ___             
\ \ / /   | |         (_)       |_  |            
 \ V /__ _| |__   __ _ _          | |_ __   __ _ 
  \ // _` | '_ \ / _` | |         | | '_ \ / _` |
  | | (_| | |_) | (_| | |  _  /\__/ / |_) | (_| |
  \_/\__,_|_.__/ \__,_|_| (_) \____/| .__/ \__, |
                                    | |     __/ |
                                    |_|    |___/ 
EOF