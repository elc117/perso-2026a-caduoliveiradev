module LogicaScramble where

import Data.Char (toLower)

-- breve explicação, aqui coloquei a logica do jogo Scramble onde o usuario recebe uma palavra embaralhada 
-- e tem que adivinhar a palavra correta. A função buscarDesafio retorna a palavra embaralhada para um 
-- determinado nível, e a função conferir verifica se a resposta do usuário está correta.
-- essa é a primeira versão da lógica, será adicionada mais coisas para deixar o jogo mais legal (ex: mais fases, dicas, etc)
-- lista para as tuplas (nivel, palavra embaralhada, resposta correta)

-- nova função auxiliar para converter uma string para minúsculas, isso é útil para a função conferir,
-- para que o jogo seja mais flexível e funcione mesmo que o usuário escreva a resposta com letras maiúsculas ou minúsculas
toLowerString :: String -> String
toLowerString = map toLower

-- lista de fases do jogo, cada fase tem um número, uma palavra embaralhada e a resposta correta
fases :: [(Int, String, String)]
fases = [
    (1, "lelkahs", "haskell"),
    (2, "nhtpoy", "python"),
    (3, "anicoflun", "funcional"),
    (4, "rgaapmçãoro", "programação"),
    (5, "cosculitomocnsiopuloripcaeimnoolcturósivcanotócsil", "pneumoultramicroscopicossilicovulcanoconiótico")
  ]

-- função para buscar o desafio (exemplo buscarDesafio 1 retorna "lelkahs")
buscarDesafio :: Int -> String
buscarDesafio n =
    case [emb | (nivel, emb, _) <- fases, nivel == n] of
        (x:_) -> x
        []    -> "fase invalida (digite de 1 até 5)"

-- função para conferir a resposta do jogador (exemplo conferir 1 "haskell" retorna True)
conferir :: Int -> String -> Bool
conferir n chute =
    case [resp | (nivel, _, resp) <- fases, nivel == n] of
        -- aplica a nova função auxiliar toLowerString para funcionar mesmo que a pessoa escreva a resposta com letras maiúsculas ou minúsculas
        (r:_) -> toLowerString chute == toLowerString r
        []    -> False