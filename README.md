# Yabai.jpg (Conversor de PSD para jpg e png)

![Plataforma](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-blue)
![Licença](https://img.shields.io/badge/license-MIT-green)

Este projeto oferece scripts para conversão em lote de arquivos Adobe Photoshop (`.psd`) para formatos de imagem mais comuns, como `.jpg` e `.png`. Inclui versões para Windows (PowerShell) e Linux/macOS (Bash), facilitando a automação do seu fluxo de trabalho.

## Recursos

- **Conversão Flexível**: Escolha converter seus arquivos `.psd` para JPG, PNG ou ambos os formatos simultaneamente.
- **Organização Automática**: Ao converter para ambos os formatos, os arquivos são salvos em subpastas separadas (`jpg/` e `png/`).
- **Interface Interativa**: Scripts fáceis de usar que guiam o usuário através de menus simples no terminal.
- **Barra de Progresso**: Acompanhe o andamento da conversão em tempo real.
- **Multiplataforma**: Suporte para Windows, Linux e macOS.

---

## Pré-requisitos

Antes de começar, você precisa ter o **ImageMagick** instalado no seu sistema. Ele é o responsável pela conversão das imagens.

- **Windows**: Baixe e instale a partir do site oficial do ImageMagick. Durante a instalação, certifique-se de marcar a opção "Install legacy utilities (e.g., convert)" para garantir a compatibilidade.
- **Linux (Debian/Ubuntu)**:
  ```bash
  sudo apt update && sudo apt install imagemagick
  ```
- **macOS (usando Homebrew)**:
  ```bash
  brew install imagemagick
  ```

---

## Como Usar

1.  **Baixe o script** correspondente ao seu sistema operacional:
    -   Para **Windows**: `yabaijpg.ps1`
    -   Para **Linux/macOS**: `psd_to_png_and_jpg.sh`

2.  **Coloque o script** na mesma pasta onde estão os seus arquivos `.psd` que você deseja converter.

3.  **Execute o script** a partir do terminal e siga as instruções na tela.

### No Windows (PowerShell)

1.  Abra o PowerShell na pasta onde está o script. Você pode fazer isso clicando com o botão direito do mouse na pasta enquanto segura a tecla `Shift` e selecionando "Abrir janela do PowerShell aqui".
2.  Se for a primeira vez que você executa um script local, pode ser necessário alterar a política de execução do PowerShell. Execute o seguinte comando:
    ```powershell
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    ```
3.  Execute o script:
    ```powershell
    ./yabaijpg.ps1
    ```

#### Exemplo de Uso no Windows:

```
PS C:\Users\User\Documents\MinhasImagens> ./yabaijpg.ps1

__   __    _           _         ___
\ \ / /   | |         (_)       |_  |
 \ V /__ _| |__   __ _ _          | |_ __   __ _
  \ // _` | '_ \ / _` | |         | | '_ \ / _` |
  | | (_| | |_) | (_| | |  _  /\__/ / |_) | (_| |
  \_/\__,_|_.__/ \__,_|_| (_) \____/| .__/ \__, |
                                    | |     __/ |
                                    |_|    |___/

Qual formato de saída você deseja?
1) JPG
2) PNG
3) Ambas (JPG e PNG em pastas separadas)
Escolha uma opção [1-3]: 1
Os arquivos serão convertidos para JPG.
Onde você deseja salvar os arquivos convertidos?
1) Na pasta atual
2) Em uma nova pasta chamada 'convertido'
Escolha uma opção [1-2]: 2
Os arquivos serão salvos na pasta 'convertido'.
Encontrados 5 arquivos para conversão.
Processando: [########################################] 100% (5/5)
Conversão para JPG concluída.

Pressione Enter para sair:
```

### No Linux / macOS (Bash)

1.  Abra um terminal.
2.  Navegue até a pasta onde você salvou o script e os arquivos `.psd`.
    ```bash
    cd /caminho/para/sua/pasta
    ```
3.  Dê permissão de execução ao script:
    ```bash
    chmod +x psd_to_png_and_jpg.sh
    ```
4.  Execute o script:
    ```bash
    ./psd_to_png_and_jpg.sh
    ```

#### Exemplo de Uso no Linux:

```
user@desktop:~/Imagens$ ./psd_to_png_and_jpg.sh
__   __    _           _         ___
\ \ / /   | |         (_)       |_  |
 \ V /__ _| |__   __ _ _          | |_ __   __ _
  \ // _` | '_ \ / _` | |         | | '_ \ / _` |
  | | (_| | |_) | (_| | |  _  /\__/ / |_) | (_| |
  \_/\__,_|_.__/ \__,_|_| (_) \____/| .__/ \__, |
                                    | |     __/ |
                                    |_|    |___/
Qual formato de saída você deseja?
1) JPG
2) PNG
3) Ambas (JPG e PNG em pastas separadas)
Escolha uma opção [1-3]: 3
Os arquivos serão convertidos para JPG e PNG, salvos em pastas separadas no diretório atual.
Encontrados 5 arquivos para conversão.
Processando: [########################################] 100% (5/5)
Conversão para JPG e PNG concluída.
```

---

## Licença
MIT License

Copyright (c) 2025 Kanb4

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
