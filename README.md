# Dividir Arquivo MP4 em Arquivos de 30 minutos
Dividir arquivo de vídeo no formato MP4 em arquivos de 30 minutos

O que esse código faz:

Baixa a versão oficial e estática do FFmpeg (sempre atualizada).

Extrai para C:\Users\SeuUsuario\ffmpeg\.

Encontra o ffmpeg.exe e adiciona o caminho ao PATH dentro da sessão R (não mexe no Windows global).

Depois executa a divisão do vídeo em partes de 30 minutos.

--------------------------------------------------------------------------
# Split MP4 File Into 30 min Files

Split a video file in MP4 format into 30-minute files

What this code does:

* Downloads the official and static version of FFmpeg (always up to date).
* Extracts it to `C:\Users\YourUser\ffmpeg\`.
* Finds `ffmpeg.exe` and adds the path to the PATH within the R session (does not modify the global Windows PATH).
* Then executes the video splitting into 30-minute parts.
