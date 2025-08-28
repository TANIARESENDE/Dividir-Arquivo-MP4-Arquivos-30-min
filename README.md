# Dividir-Arquivo-MP4-Arquivos-30-min
Dividir arquivo de vídeo no formato MP4 em arquivos de 30 minutos

O que esse código faz:

Baixa a versão oficial e estática do FFmpeg (sempre atualizada).

Extrai para C:\Users\SeuUsuario\ffmpeg\.

Encontra o ffmpeg.exe e adiciona o caminho ao PATH dentro da sessão R (não mexe no Windows global).

Depois executa a divisão do vídeo em partes de 30 minutos.

👉 Isso garante que funciona mesmo em um Windows “limpo”, sem Chocolatey ou Homebrew.
