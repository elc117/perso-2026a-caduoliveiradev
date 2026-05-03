FROM haskell:9.8.4

WORKDIR /app

# Instala dependências básicas do sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    libsqlite3-dev \
    pkg-config \
 && rm -rf /var/lib/apt/lists/*

# Copia todos os arquivos do projeto
COPY . .

# Instala as bibliotecas necessárias
RUN cabal update && cabal install --lib scotty text

# Muda para a pasta src para compilar
WORKDIR /app/src

# Compila o Main.hs garantindo que ele encontre o LogicaScramble.hs na mesma pasta
RUN ghc -threaded Main.hs -o Main

# A Render usa a porta definida na variável de ambiente PORT
EXPOSE 3000

# Executa o servidor
CMD ["./Main"]