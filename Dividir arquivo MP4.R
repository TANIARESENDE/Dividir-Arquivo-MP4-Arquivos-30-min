install_ffmpeg_windows <- function() {
  message("Baixando e instalando FFmpeg no Windows...")
  
  # URL do FFmpeg build estável (site gyan.dev, mantido pela comunidade)
  url <- "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip"
  
  # Pasta temporária e destino
  destfile <- tempfile(fileext = ".zip")
  destdir <- file.path(Sys.getenv("USERPROFILE"), "ffmpeg")
  
  # Baixa o arquivo
  download.file(url, destfile, mode = "wb")
  
  # Extrai
  unzip(destfile, exdir = destdir)
  
  # Procura a pasta bin (onde está o ffmpeg.exe)
  bin_dir <- list.dirs(destdir, recursive = TRUE, full.names = TRUE)
  bin_dir <- bin_dir[grepl("bin$", bin_dir)][1]
  
  if (!file.exists(file.path(bin_dir, "ffmpeg.exe"))) {
    stop("Não foi possível localizar o ffmpeg.exe")
  }
  
  # Adiciona ao PATH apenas dentro da sessão R
  Sys.setenv(PATH = paste(bin_dir, Sys.getenv("PATH"), sep = ";"))
  
  message("✅ FFmpeg instalado e configurado com sucesso!")
}

# Função para verificar/instalar ffmpeg e dividir vídeo
split_video <- function(input_file, chunk_length = 30*60) {
  # Testa se ffmpeg está no PATH
  if (system("ffmpeg -version", ignore.stdout = TRUE, ignore.stderr = TRUE) != 0) {
    os <- Sys.info()[["sysname"]]
    if (os == "Windows") {
      install_ffmpeg_windows()
    } else if (os == "Linux") {
      system("sudo apt-get update && sudo apt-get install -y ffmpeg")
    } else if (os == "Darwin") {
      system("brew install ffmpeg")
    } else {
      stop("Sistema operacional não suportado para instalação automática.")
    }
  }
  
  # Nome base e extensão
  base <- tools::file_path_sans_ext(input_file)
  ext <- tools::file_ext(input_file)
  output_pattern <- paste0(base, "_part%03d.", ext)
  
  # Comando FFmpeg
  cmd <- sprintf(
    'ffmpeg -i "%s" -c copy -map 0 -f segment -segment_time %d -reset_timestamps 1 "%s"',
    input_file, chunk_length, output_pattern
  )
  
  # Executa
  system(cmd)
  message("✅ Vídeo dividido com sucesso!")
}

# Exemplo de uso
split_video("C:/Users/User/dwhelper/Bonus Responsabilidade Civil e IA.mp4")
